# Lab notebook
Author Owen Chapman  
Should have started this awhile ago but rather late than never.

# 2024-12-09 GSEA w.r.t. Wanchen's targets

## Methods
Data are single-cell RNA-seq from Shiraishi *et al*. 1 sample each for gnp, pnc, and tumor. Gene expression was batch-integrated with scGen, see `single-cell/batch-correction-scgen.ipynb`. Gene sets were sets of 34, 22, and 10 potential targets of Kmt2c and/or Chd7 identified in Wanchen's manuscript under revision. All pairwise comparisons were performed by GSEA desktop 4.3.3 using the following parameters:
- Collapse: no collapse
- Permutation: phenotype
- min size: 5
- create svg: True
and all other parameters default.

## Results
### tumor vs. pnc
All sets enriched in pnc.
### pnc vs. gnp
No significant enrichments detected. Also, only 984/14044 genes were upregulated in gnp vs pnc (7%), which is pretty unusual and may suggest a bias introduced at batch correction.
### tumor vs. gnp
No significant enrichments detected. Same problem of >10% of genes upregulated in the gnp phenotype. While this indicates a systematic bias associated with gnp cells, it may not necessarily invalidate the results, since a rank test such as GSEA should be relatively invariant to systematic biases of this kind.

### Discussion
The tumor-pnc result is convincing, since these gene sets were defined in a semi-orthogonal experiment. Negative results in gnp comparisons could be attributable to any number of factors: true biology, bias introduced or not corrected by batch integration, heterogeneity of gnp cells.  
Results uploaded to [OneDrive/shhmb-chd7-kmt2c/GSEA-DKO-targets](https://1drv.ms/f/c/a836ccc14c371f14/Ei1jIgVzOKhCpoYDZU68Yu4B7ITea2iO1zglX2U1HEZzaQ?e=x5bs7X).

# 2025-01-07 New targets

## Goal
Reanalyze Neurod1 including RCMB56 Hi-C data. Analyze new targets Lrrc55, Syn3, Insyn2a.

## Results
*Neurod1.* No interesting peak-promoter interactions in RCMB56 at the Neurod1 locus.

*Lrrc55.* Pretty consistent TAD including Lrrc55, but no loops specifically interacting with the promoter.

*Syn3.* Only local downstream synteny preserved; local TAD is conserved but larger chromatin context may not be
        No interactions to identified loci.

*Insyn2a.* No nearby loops.
