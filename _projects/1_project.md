---
layout: page
title: Geometric &amp; topological deep learning
description: Rewiring and lifting techniques against oversmoothing and oversquashing in graph learning
img: assets/img/12.jpg
importance: 1
category: research
related_publications: false
---

**INRIA Saclay &amp; CentraleSupélec &mdash; research assistant (2026)**

Graph neural networks struggle with two coupled pathologies: **oversmoothing** (node
representations collapse as depth grows) and **oversquashing** (information from distant nodes is
compressed through bottleneck edges). This project studies *graph rewiring* and *topological
lifting* as ways to mitigate both.

Work in progress covers:

- higher-order and topological architectures &mdash; CWN, CIN, GIN, GPS, GAN;
- lifting simplicial / cell complexes from graphs and learning on them;
- reusing and extending recent topological deep learning tooling: **DiffLift**, **TopoTune**,
  **TopoModelX**.

The goal is a systematic comparison of rewiring/lifting strategies and the regimes in which each
helps.
