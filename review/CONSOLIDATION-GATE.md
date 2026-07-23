# Consolidation Gate — REVIEW vs NEW (fonte única dos limiares)

Roda antes de qualquer ensino. Imprime um readout curto e sobreponível.

## Sinais (calculados do estado do repo vs data de hoje)
- `overdue` = cards com due < hoje · `due_today` = cards com due == hoje
- `weak_open` = linhas abertas em review/to-review.md
- `young` = cards com reps < 2 · `consolidated` = reps >= 2 e não atrasados
- `total_cards` · `C = consolidated / total_cards` · `U = young + overdue`
- `last_review_accuracy` (de progress.json → review_tracking)

## Escada de decisão (primeira que casar vence)
- **R0 OVERRIDE** — aluno nomeou tópico ou disse "new"/"aprender X" → LEARN
- **R1 COLD START** — total_cards == 0 → LEARN
- **R2 OVERDUE** — overdue >= 1 → REVIEW
- **R3 WEAK SPOT** — weak_open >= 1 → REVIEW
- **R4 ACCURACY** — last_review_accuracy != null e < 0.80 → REVIEW
- **R5 LOAD** — C < 0.67 → REVIEW
- **R6 BIG DUE** — due_today >= 8 → REVIEW
- **R7 DEFAULT** — senão → LEARN (aquecer com 1–7 cards devidos)

## Readout impresso a cada sessão
```
🚦 Consolidation Gate
   Devidos / atrasados ... <due_total> (<overdue> atrasados)
   Pontos fracos abertos . <weak_open>
   Consolidação .......... <C%>  (<consolidated>/<total_cards> firmes)
   Última acurácia ....... <valor ou —>
→ Decisão: <REVIEW|LEARN> (<regra>: <motivo>).  (diga "novo"/"revisar" p/ trocar)
```

Limiares: 0.80 (barra de aprovação de estágio), 0.67 (teto de 1/3 de dívida),
8 (~uma sessão de revisão). Ajustar SOMENTE aqui.
