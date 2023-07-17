COMMENT ON TABLE person_discounts IS 'Table of personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'Primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'Person foreign key';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria foreign key';
COMMENT ON COLUMN person_discounts.discount IS 'Personal discount as a percentege';