# 📻 Ativando o NotebookLM (fábrica de mídia: podcasts, mapas mentais, vídeos)

A CLI usada é a biblioteca **não-oficial** `notebooklm-py`. Ela automatiza uma
conta pessoal do notebooklm.google.com e precisa de **cookies de sessão** do seu
login Google. Como este ambiente na nuvem é efêmero e sem navegador interativo,
autenticamos pela variável de ambiente `NOTEBOOKLM_AUTH_JSON` (caminho de CI/CD).

## Passo 1 — Gerar as credenciais NA SUA MÁQUINA (uma vez, com navegador)
```sh
pip install notebooklm-py
notebooklm login          # abre o navegador; faça login no Google + 2FA
notebooklm doctor         # confirme Auth ✓
```
Isso cria o arquivo:
`~/.notebooklm/profiles/default/storage_state.json`

## Passo 2 — Colocar as credenciais NESTE ambiente da nuvem (como SECRET)
Copie **todo o conteúdo** do `storage_state.json` e cadastre-o como a variável
de ambiente **`NOTEBOOKLM_AUTH_JSON`** nas configurações do ambiente do
Claude Code na web (secret do ambiente). NÃO cole no chat, NÃO commite no git.

> 🔐 Esse JSON equivale a uma senha: dá acesso à sua sessão Google. Trate como
> segredo. O `.gitignore` deste repo já bloqueia arquivos de auth por precaução.

## Passo 3 — Verificar (o tutor faz por você)
```sh
bash tools/setup-notebooklm.sh      # reinstala a CLI
.nblm-venv/bin/notebooklm auth check --test
.nblm-venv/bin/notebooklm list      # deve listar seus notebooks
```
Depois disso o tutor cria UM notebook dedicado ("Estudos — Tutor") e passa a
gerar áudios/mapas/vídeos automaticamente quando um conceito pedir.

## Manutenção
- Cookies expiram: rode `notebooklm auth refresh` localmente e atualize o secret.
- Enquanto o secret não estiver definido, o tutor usa os gráficos HTML (`visuals/`).
