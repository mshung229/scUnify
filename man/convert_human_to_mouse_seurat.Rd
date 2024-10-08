% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/genesymbol.R
\name{convert_human_to_mouse_seurat}
\alias{convert_human_to_mouse_seurat}
\title{convert_human_to_mouse_seurat}
\usage{
convert_human_to_mouse_seurat(
  x,
  orig.assay = "RNA",
  new.assay = "RNA.MM",
  unique = T
)
}
\arguments{
\item{x}{Seurat object}

\item{orig.assay}{Original assay name}

\item{new.assay}{New assay name}

\item{unique}{Whether to disable one-to-many MGI gene symbols to be returned. Defaults to TRUE to disable one-to-many mapping (TRUE)}
}
\value{
If unique = TRUE, returns a vector of unique MGI gene symbols that are mapped one-to-one.
If unique = FALSE, returns a data frame with columns "MGI.symbol" and "HGNC.symbol" that are mapped one-to-many.
}
\description{
Make a Seurat assay converting human (HGNC) gene symbols to mouse (MGI) gene symbols ; disable one-to-many mapping
}
