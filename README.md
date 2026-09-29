# Inside a 100,000-document RAG Knowledge Base: An Animated Walkthrough

Salinan website interaktif [Inside a 100,000-document RAG knowledge base](https://ardyadipta.github.io/blog/rag-pipeline-explainer.html) yang dibuat sepenuhnya self-contained dan dapat dijalankan di lokal tanpa koneksi internet.

## Daftar Halaman / Langkah (Steps 1 – 12):
1. **The corpus at scale** (`#s=1`) - 100,000 mixed documents (PDF, scans, images), breakdown biaya parsing vs embedding.
2. **Manifest and dedupe** (`#s=2`) - Ingestion manifest, deduplikasi exact (SHA-256) & near-dedup (MinHash).
3. **Tiered parsing** (`#s=3`) - Routing dokumen ke Tier 0 (layout), Tier 1 (OCR), Tier 2 (VLM) menghasilkan Canonical IR.
4. **Structure-aware chunking** (`#s=4`) - Chunking berbasis heading hierarchy, tabel utuh, breadcrumbs & parent-child indexing.
5. **Enrichment, then embedding** (`#s=5`) - System metadata, extracted metadata, dan vektor embedding.
6. **Storage and indexes** (`#s=6`) - Canonical IR sebagai source of truth: BM25, HNSW vector index, Knowledge Graph.
7. **Metadata filtering** (`#s=7`) - Security ACL filtering, pre-filtering vs post-filtering pada HNSW traversal.
8. **BM25 lexical search** (`#s=8`) - Exact identifiers, term-frequency saturation (k1), length normalization (b).
9. **Semantic search (HNSW)** (`#s=9`) - Layered HNSW graph traversal dan beam width (`ef_search`).
10. **Hybrid retrieval + rerank** (`#s=10`) - Penggabungan BM25 + Dense dengan Reciprocal Rank Fusion (RRF) & Cross-encoder reranker.
11. **GraphRAG** (`#s=11`) - Ekstraksi entitas & relasi bertipe, Leiden community detection, local & global search.
12. **End-to-end query path** (`#s=12`) - Alur query lengkap mulai dari auth, rewrite, parallel retrieval, rerank, context assembly, hingga streaming generation (~1.5s).

---

## Cara Menjalankan di Local

### Opsi 1: Double-Click File `run.bat` (Paling Praktis di Windows)
Cukup klik dua kali file `run.bat`. Script akan otomatis:
- Menjalankan local server (Python atau Node).
- Membuka browser langsung ke `http://localhost:8080/#s=1`.

### Opsi 2: Menggunakan Python
Buka terminal / PowerShell di folder ini, lalu jalankan:
```bash
python -m http.server 8080
```
Buka browser di:
- `http://localhost:8080/#s=1` (Halaman 1)
- `http://localhost:8080/#s=12` (Halaman 12)

### Opsi 3: Menggunakan Node / npm
```bash
npm start
```
atau
```bash
npx serve -l 8080 .
```

### Opsi 4: Buka Langsung File HTML
Karena file ini 100% self-contained (tidak membutuhkan server backend dan tidak memuat file eksternal dari CDN/internet), Anda juga bisa langsung membuka file:
- Klik dua kali file `index.html` di Windows Explorer.
- Anda dapat berpindah ke halaman mana pun menggunakan menu navigasi sebelah kiri, tombol Prev / Next, keyboard arrow (← / →), atau menambahkan `#s=1` sampai `#s=12` di URL browser.
