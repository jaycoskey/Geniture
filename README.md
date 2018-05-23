# Geniture

Note: The GEDCOM file royals.ged is derived from the one downloadable from http://kingscoronation.com/queen-elizabeth-ii-gedcom-download/

Proposed phases of development:
 * Phase 1: Read in and print out a GEDCOM file
 * Phase 2: Create Postgres DB tables to represent the data in the current GEDCOM file (but not all of GEDCOM) (use timestamp for dates))
 * Phase 3: Generate SQL INSERT INTO statements from the sample GEDCOM file
 * Phase 4: Create JSON-based API to read/write genealogy data
 * Phase 5: Create website that supports navigation/editing of genealogy data via the API

Other possible features:
 * Implement some of the ideas (e.g., "link and layer") from Mark Tucker's paper 10 Things Genealogy Software Should Do
 * Represent dates using a more fluid representation of dates that can represent partial information or uncertainty
 * Support a greater percentage of the GEDCOM format.

