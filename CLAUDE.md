# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Context

This repository contains research materials and documentation related to an H5N1 avian influenza case involving ostrich farming in Canada. The primary focus is a legal case where CFIA ordered the culling of ostriches, and the farm owners are fighting to preserve surviving birds for scientific research.

## Directory Structure

- `content/legal/` - Legal documents and court materials
  - `JR-T-294-25-and-T-432-25-Final.pdf` - Court decision document
  - `legal_arguments.md` - Legal strategies and arguments for the case
  - `decision.md` - Extracted court decision content (very large file)
  - `decision_extracted.md` - Processed version of court decision
- `content/website/` - Research content and website materials
  - `h5n1_status.md` - Comprehensive H5N1 status report for North America (May 2025)
  - `dataset_website-content-crawler_2025-05-27_06-59-33-389.jsonl` - Website crawl data

## Document Analysis Approach

When working with this repository:

1. **Large Files**: `content/legal/decision.md` is extremely large (25,963+ tokens). Use offset/limit parameters when reading or use Grep tool for specific content searches.

2. **Legal Content**: The legal arguments focus on challenging CFIA's "stamping out" policy for ostriches, emphasizing their research value and potential immunity.

3. **Scientific Context**: The H5N1 status document provides comprehensive North American epidemiological data as of May 2025, including differences between US and Canadian situations.

4. **Research Focus**: The case centers on the scientific value of surviving ostriches that may have developed immunity to H5N1, with arguments for exemption from culling for research purposes.

## Content Analysis Guidelines

- Legal arguments emphasize procedural fairness, scientific value, and proportionality of government response
- H5N1 data shows significant differences between US (dairy cattle affected) and Canada (no dairy cattle cases)
- The case involves tension between disease control policy and scientific research opportunities
- Documents contain extensive citations and references to Canadian law, CFIA policies, and scientific literature

## File Format Notes

- Most content is in Markdown format with extensive footnotes and references
- The JSONL file contains structured web crawl data
- PDF contains official court documentation
- Large text files may require chunked reading approaches