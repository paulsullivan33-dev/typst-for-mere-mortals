#set page(paper: "a4", margin: 2.2cm, numbering: "1", number-align: center)
#set text(size: 11pt)

#let rows = csv("inventory.csv")
#let header = rows.first()
#let items = rows.slice(1)
#let meta = json("inventory.json")

#let total-items = items.map(r => int(r.at(3))).sum()
#let total-value = items.map(r => float(r.at(2)) * int(r.at(3))).sum()
#let total-value = calc.round(total-value, digits: 2)

#let money(v) = {
  let r = calc.round(v, digits: 2)
  let pounds = calc.floor(r)
  let pence = calc.round((r - pounds) * 100)
  "£" + str(pounds) + "." + if pence < 10 { "0" } + str(pence)
}

#metadata(str(total-value)) <shed-total>

= #meta.society: tool shed stock report

Season: #meta.season. The shed budget for the year is
£#meta.budget_gbp. This report is generated from `inventory.csv`;
nothing in the table below is typed by hand.

#table(
  columns: (1fr, auto, auto, auto, auto),
  align: (left, left, right, right, right),
  [*Item*], [*Category*], [*Unit price*], [*Qty*], [*Line value*],
  ..items.map(r => (
    r.at(0),
    r.at(1),
    "£" + r.at(2),
    r.at(3),
    money(float(r.at(2)) * int(r.at(3))),
  )).flatten(),
  [*Total*], [], [], [#total-items], [*#money(total-value)*],
)

The shed currently holds #total-items items with a replacement
value of #money(total-value), against a budget of £#meta.budget_gbp.

== Restock list

Already on order or to buy before spring:

#for thing in meta.restock [- #thing]
