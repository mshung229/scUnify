#' dependencies
#'
#' load vdj dependencies
#' @export
library(alakazam)
library(scoper)
library(dplyr)
library(Seurat)
library(shazam)
library(dowser)

#' seurat_add_dandelion
#'
#' add dandelion output to seurat object metadata
#' @param x Seurat object
#' @param vdj dataframe of "all/filtered_contig_dandelion.tsv"
#' @param paired if TRUE, keep cells with a single heavy and a single light chain sequence
#' @export
seurat_add_dandelion <- function(x, vdj, paired = T){
    vdj <- vdj %>%
        filter(filter_contig == "False" & productive_VDJ == "T") %>%
        select(!samples)

    if(paired){
        vdj <- vdj %>%
            filter(chain_status == "Single pair" & productive_VDJ == "T")}

    metadata <- x@meta.data %>%
        merge(., vdj, by = 0, all.x = T) %>%
        group_by(clone_id) %>%
        mutate(
            cellxclone = n(),
            clone_size_group = case_when(
                cellxclone > 30 ~ "Hyperexpanded (30< X)",
                cellxclone > 10 & cellxclone <= 30 ~ "Large (11< X ≤30)",
                cellxclone > 5 & cellxclone <= 10 ~ "Medium (5< X ≤10)",
                cellxclone >= 2 & cellxclone <=5 ~ "Small (1< X ≤5)",
                .default = "Single (0< X ≤1)")) %>%
        mutate(clone_size_group = factor(clone_size_group, c("Single (0< X ≤1)", "Small (1< X ≤5)", "Medium (5< X ≤10)", "Large (11< X ≤30)", "Hyperexpanded (30< X)"))) %>%
        ungroup() %>%
        column_to_rownames("Row.names")
    x@meta.data <- metadata[rownames(x@meta.data),]
    return(x)}

#' plot_vdj_qc
#'
#' plot proportion of cells that has VDJ library
#' @param x Seurat object
#' @param group.by column to group cells by
#' @export
plot_vdj_qc <- function(x, group.by = "samples"){
    plot <- x@meta.data %>%
        group_by_at(c(group.by, "filter_contig")) %>%
        summarize(count = n()) %>%
        group_by_at(group.by) %>%
        mutate(pct = count*100/sum(count)) %>%
        ggplot(aes_string(x = group.by, y = "pct", fill = "filter_contig")) +
        geom_col(width = 0.85, position = "stack", col = "white") +
        guides(fill = guide_legend(title = "")) +
        theme_line() +
        xlab("") +
        ylab("Proportions (%)")
    return(plot)}

#' plot_vdj
#'
#' plot vdj information for cells
#' @param x Seurat object
#' @param group.by column to group cells by
#' @export
plot_vdj <- function(x, group.by, facet.by = NULL, variable = "isotype"){

    if(!variable %in% c("isotype", "clone_size_group")){
        stop('make sure variable must be either "isotype" or "clone_size_group"')}

    if(length(facet.by) > 0){
        group <- c(group.by, facet.by)}
    else{
	group <- group.by}

    if(variable == "isotype"){
        cols <- c("brown", palette_list[["darjeeling_5"]][c(1,5,2,3)])
        names(cols) <- c("IgD", "IgM", "IgA", "IgG", "IgE")
        metadata <- x@meta.data %>%
            filter(str_detect(isotype, "^Ig[DMAGE]$")) %>%
            mutate(isotype = factor(isotype, names(cols)))}
    else if(variable == "clone_size_group"){
        cols <- palette_list[["zissou_5"]]
        names(cols) <- c("Single (0< X ≤1)", "Small (1< X ≤5)", "Medium (5< X ≤10)", "Large (11< X ≤30)", "Hyperexpanded (30< X)")
        metadata <- x@meta.data}

    plot <- metadata %>%
        group_by_at(c(group, variable)) %>%
        summarize(count = n()) %>%
        group_by_at(group) %>%
        mutate(pct = count*100/sum(count)) %>%
        ggplot(aes_string(x = group.by, y = "pct", fill = variable)) +
        geom_col(width = 0.85, position = "stack", col = "white") +
        scale_fill_manual(values = cols) +
        guides(fill = guide_legend(title = "")) +
        theme_line() +
        xlab("") +
        ylab("Proportions (%)")

    if(length(facet.by) == 1){
        plot <- plot +
            facet_wrap(as.formula(paste0("~ ", facet.by)), nrow = 1) +
            facet_aes()}

    return(plot)
}

#' plot_shm
#'
#' plot somatic hypermuation
#' @param x Seurat object
#' @param group.by column to group cells by
#' @param facet.by variable to facet by
#' @param cols colors
#' @export
plot_shm <- function(x, group.by, facet.by = NULL, cols = NULL){
    #if(!all(unique(x@meta.data[[group.by]]) %in% names(cols))){
    #    stop('please make sure "cols" is a named vector of colors corresponding to the levels in "group.by"')}

    if(length(facet.by) > 0){
        group <- c(group.by, facet.by)}
    else{
        group <- group.by}

    plot <- x@meta.data %>%
        filter(!is.na(mu_freq)) %>%
        ggplot(aes_string(x = group.by, y = "mu_freq", fill = group.by)) +
        geom_violin(trim = T, adjust = 1.5, drop = T, bw = "nrd0", scale = "width") +
        guides(fill = guide_legend(title = "")) +
        theme_line() +
        xlab("") +
        ylab("Mutation Frequency")

    if(length(cols) > 0){
        plot <- plot +
            scale_fill_manual(values = cols)}

    if(length(facet.by) > 0){
        plot <- plot +
            facet_wrap(as.formula(paste0("~ ", facet.by)), nrow = 1) +
            facet_aes()}

    return(plot)
}