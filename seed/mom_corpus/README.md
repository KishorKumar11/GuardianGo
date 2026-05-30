# MOM Corpus — Curated Knowledge Base

These files contain plain-text extracts from official MOM sources.
Each file = one topic area. Sources:
- https://www.mom.gov.sg/passes-and-permits/work-permit-for-foreign-domestic-worker
- https://ask.gov.sg/mom
- https://www.mom.gov.sg/employment-practices/salary

## Adding new content
1. Extract plain text from a mom.gov.sg page.
2. Add as a `.txt` file in this directory named `<topic>.txt`.
3. Run: `dart run seed/embed_corpus.dart`

## Topics covered
- work_permit.txt — eligibility, renewal, conditions
- salary_rights.txt — minimum wage, OT, salary payment rules
- injury_wica.txt — WICA claims process, employer obligations
- rest_days.txt — rest day entitlements, public holidays
- dispute_channels.txt — MOM hotline, TADM, how to report
