#!/usr/bin/env python3
"""Draw a simple SVG bar chart: seedlings raised per month, spring 2026.
Fictional figures for the Bramble Lane Allotment Society."""
import html

months = ["Mar", "Apr", "May", "Jun", "Jul"]
values = [42, 118, 203, 176, 96]

W, H = 520, 300
base = H - 40          # y of the axis
top = 30               # headroom
maxv = max(values)
bar_w, gap = 64, 28
x0 = 60

def y(v):
    return base - (v / maxv) * (base - top)

parts = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}">']
parts.append(f'<rect width="{W}" height="{H}" fill="white"/>')
parts.append(f'<line x1="{x0 - 10}" y1="{base}" x2="{W - 20}" y2="{base}" stroke="black" stroke-width="2"/>')
for i, (m, v) in enumerate(zip(months, values)):
    x = x0 + i * (bar_w + gap)
    parts.append(f'<rect x="{x}" y="{y(v):.1f}" width="{bar_w}" height="{base - y(v):.1f}" fill="#4a7c59"/>')
    parts.append(f'<text x="{x + bar_w/2}" y="{y(v) - 8:.1f}" font-family="sans-serif" font-size="15" text-anchor="middle">{v}</text>')
    parts.append(f'<text x="{x + bar_w/2}" y="{base + 22}" font-family="sans-serif" font-size="15" text-anchor="middle">{html.escape(m)}</text>')
parts.append("</svg>")
open("chart.svg", "w").write("\n".join(parts) + "\n")
print("wrote chart.svg:", sum(values), "seedlings in total")
