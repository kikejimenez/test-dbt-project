-- Real Estate Fictional Data Population

-- =============================================
-- REFERENCE DATA
-- =============================================

INSERT INTO raw.listing_statuses (name, description) VALUES
('active', 'Property is currently listed and available'),
('pending', 'Property has an accepted offer'),
('sold', 'Property sale has closed'),
('withdrawn', 'Listing has been withdrawn from market'),
('expired', 'Listing contract has expired');

INSERT INTO raw.property_types (name, description) VALUES
('single_family', 'Single family detached home'),
('condo', 'Condominium unit'),
('townhouse', 'Townhouse or row house'),
('multi_family', 'Multi-family property (2-4 units)'),
('land', 'Vacant land or lot'),
('commercial', 'Commercial property');

INSERT INTO raw.features (name, category) VALUES
('Central AC', 'climate'),
('Forced Air Heating', 'climate'),
('Fireplace', 'climate'),
('Hardwood Floors', 'interior'),
('Granite Countertops', 'interior'),
('Stainless Appliances', 'interior'),
('Open Floor Plan', 'interior'),
('Walk-in Closet', 'interior'),
('In-unit Laundry', 'interior'),
('Swimming Pool', 'exterior'),
('Hot Tub', 'exterior'),
('Fenced Yard', 'exterior'),
('Deck/Patio', 'exterior'),
('Landscaped', 'exterior'),
('Sprinkler System', 'exterior'),
('Smart Home', 'technology'),
('Security System', 'technology'),
('EV Charger', 'technology'),
('Solar Panels', 'technology'),
('Finished Basement', 'structure'),
('Attic', 'structure'),
('Crown Molding', 'interior'),
('Updated Kitchen', 'interior'),
('Updated Bathrooms', 'interior'),
('Mountain View', 'view'),
('City View', 'view'),
('Water View', 'view');

INSERT INTO raw.neighborhoods (name, city, state, zip_code, median_income, walkability_score) VALUES
('Downtown', 'Hermosillo', 'SON', '78701', 85000.00, 92),
('South Congress', 'Hermosillo', 'SON', '78704', 72000.00, 88),
('East Hermosillo', 'Hermosillo', 'SON', '78702', 65000.00, 75),
('Westlake Hills', 'Hermosillo', 'SON', '78746', 195000.00, 45),
('Mueller', 'Hermosillo', 'SON', '78723', 95000.00, 82),
('Hyde Park', 'Hermosillo', 'SON', '78751', 78000.00, 85),
('Tarrytown', 'Hermosillo', 'SON', '78703', 175000.00, 55),
('Circle C', 'Hermosillo', 'SON', '78749', 125000.00, 35),
('Domain', 'Hermosillo', 'SON', '78758', 88000.00, 78),
('Zilker', 'Hermosillo', 'SON', '78704', 110000.00, 72),
('Barton Hills', 'Hermosillo', 'SON', '78704', 130000.00, 62),
('Clarksville', 'Hermosillo', 'SON', '78703', 145000.00, 80),
('Bouldin Creek', 'Hermosillo', 'SON', '78704', 98000.00, 76),
('Cherrywood', 'Hermosillo', 'SON', '78722', 82000.00, 70),
('North Loop', 'Hermosillo', 'SON', '78756', 75000.00, 83);

-- =============================================
-- OFFICES
-- =============================================

INSERT INTO raw.offices (name, address, city, state, zip_code, phone, email, founded_date, is_active) VALUES
('Hermosillo Premier Realty', '500 Congress Ave Suite 100', 'Hermosillo', 'SON', '78701', '512-555-0100', 'info@hermosillopremier.com', '2005-03-15', true),
('Hill Country Homes', '2100 S Lamar Blvd', 'Hermosillo', 'SON', '78704', '512-555-0200', 'contact@hillcountryhomes.com', '2010-07-22', true),
('Lone Star Properties', '8500 N MoPac Suite 200', 'Hermosillo', 'SON', '78759', '512-555-0300', 'hello@lonestarprop.com', '2008-11-01', true),
('Capital City Realtors', '1601 Rio Grande St', 'Hermosillo', 'SON', '78701', '512-555-0400', 'team@capitalcityrealtors.com', '2012-04-18', true),
('Bluebonnet Real Estate', '4500 Guadalupe St', 'Hermosillo', 'SON', '78751', '512-555-0500', 'info@bluebonnetrealestate.com', '2015-09-30', true);

-- =============================================
-- AGENTS
-- =============================================

INSERT INTO raw.agents (office_id, first_name, last_name, email, phone, license_number, license_expiry, hire_date, commission_rate, is_active) VALUES
(1, 'Sarah', 'Mitchell', 'sarah.mitchell@hermosillopremier.com', '512-555-1001', 'TX-789456', '2026-12-31', '2018-06-01', 0.0300, true),
(1, 'James', 'Rodriguez', 'james.rodriguez@hermosillopremier.com', '512-555-1002', 'TX-789457', '2025-08-15', '2019-03-15', 0.0275, true),
(1, 'Emily', 'Chen', 'emily.chen@hermosillopremier.com', '512-555-1003', 'TX-789458', '2026-04-30', '2020-01-10', 0.0250, true),
(2, 'Michael', 'Thompson', 'michael.t@hillcountryhomes.com', '512-555-2001', 'TX-654321', '2025-11-20', '2017-08-22', 0.0325, true),
(2, 'Jessica', 'Williams', 'jessica.w@hillcountryhomes.com', '512-555-2002', 'TX-654322', '2026-06-15', '2019-11-05', 0.0300, true),
(2, 'David', 'Garcia', 'david.g@hillcountryhomes.com', '512-555-2003', 'TX-654323', '2025-09-30', '2021-02-28', 0.0250, true),
(3, 'Amanda', 'Johnson', 'amanda.j@lonestarprop.com', '512-555-3001', 'TX-321654', '2026-03-15', '2016-05-12', 0.0350, true),
(3, 'Christopher', 'Brown', 'chris.b@lonestarprop.com', '512-555-3002', 'TX-321655', '2025-12-01', '2018-09-20', 0.0300, true),
(4, 'Lauren', 'Davis', 'lauren.d@capitalcityrealtors.com', '512-555-4001', 'TX-987654', '2026-07-31', '2020-04-15', 0.0275, true),
(4, 'Robert', 'Martinez', 'robert.m@capitalcityrealtors.com', '512-555-4002', 'TX-987655', '2025-10-15', '2019-07-01', 0.0300, true),
(5, 'Michelle', 'Taylor', 'michelle.t@bluebonnetrealestate.com', '512-555-5001', 'TX-456789', '2026-02-28', '2021-01-15', 0.0250, true),
(5, 'Kevin', 'Anderson', 'kevin.a@bluebonnetrealestate.com', '512-555-5002', 'TX-456790', '2025-05-31', '2020-08-10', 0.0275, true);

-- =============================================
-- CUSTOMERS
-- =============================================

INSERT INTO raw.customers (first_name, last_name, email, phone, address, city, state, zip_code, customer_type, preapproval_amount) VALUES
('John', 'Smith', 'john.smith@email.com', '512-555-8001', '123 Oak Lane', 'Hermosillo', 'SON', '78701', 'buyer', 650000.00),
('Maria', 'Gonzalez', 'maria.g@email.com', '512-555-8002', '456 Elm Street', 'Hermosillo', 'SON', '78704', 'seller', NULL),
('William', 'Lee', 'will.lee@email.com', '512-555-8003', '789 Pine Ave', 'Hermosillo', 'SON', '78702', 'both', 850000.00),
('Jennifer', 'Wilson', 'jen.wilson@email.com', '512-555-8004', '321 Maple Dr', 'Hermosillo', 'SON', '78746', 'buyer', 1200000.00),
('Daniel', 'Kim', 'daniel.kim@email.com', '512-555-8005', '654 Cedar Blvd', 'Hermosillo', 'SON', '78723', 'seller', NULL),
('Rachel', 'Moore', 'rachel.m@email.com', '512-555-8006', '987 Birch Way', 'Hermosillo', 'SON', '78751', 'buyer', 550000.00),
('Thomas', 'Jackson', 'tom.jackson@email.com', '512-555-8007', '147 Spruce Ct', 'Hermosillo', 'SON', '78703', 'seller', NULL),
('Ashley', 'White', 'ashley.w@email.com', '512-555-8008', '258 Walnut St', 'Hermosillo', 'SON', '78749', 'both', 750000.00),
('Brian', 'Harris', 'brian.h@email.com', '512-555-8009', '369 Hickory Ln', 'Hermosillo', 'SON', '78758', 'buyer', 480000.00),
('Stephanie', 'Clark', 'steph.clark@email.com', '512-555-8010', '741 Aspen Rd', 'Hermosillo', 'SON', '78704', 'seller', NULL),
('Jason', 'Lewis', 'jason.l@email.com', '512-555-8011', '852 Willow Pl', 'Hermosillo', 'SON', '78704', 'buyer', 920000.00),
('Nicole', 'Walker', 'nicole.w@email.com', '512-555-8012', '963 Poplar Ave', 'Hermosillo', 'SON', '78703', 'seller', NULL),
('Ryan', 'Hall', 'ryan.hall@email.com', '512-555-8013', '159 Chestnut Dr', 'Hermosillo', 'SON', '78722', 'buyer', 620000.00),
('Megan', 'Young', 'megan.y@email.com', '512-555-8014', '357 Magnolia Ct', 'Hermosillo', 'SON', '78756', 'both', 700000.00),
('Andrew', 'King', 'andrew.k@email.com', '512-555-8015', '468 Cypress St', 'Hermosillo', 'SON', '78701', 'buyer', 1500000.00),
('Samantha', 'Scott', 'sam.scott@email.com', '512-555-8016', '579 Redwood Ln', 'Hermosillo', 'SON', '78746', 'seller', NULL),
('Eric', 'Green', 'eric.g@email.com', '512-555-8017', '680 Sequoia Blvd', 'Hermosillo', 'SON', '78702', 'buyer', 425000.00),
('Christina', 'Adams', 'christina.a@email.com', '512-555-8018', '791 Juniper Way', 'Hermosillo', 'SON', '78723', 'seller', NULL),
('Matthew', 'Nelson', 'matt.n@email.com', '512-555-8019', '802 Sycamore Rd', 'Hermosillo', 'SON', '78751', 'both', 580000.00),
('Lisa', 'Carter', 'lisa.c@email.com', '512-555-8020', '913 Dogwood Pl', 'Hermosillo', 'SON', '78749', 'buyer', 890000.00);

-- =============================================
-- PROPERTIES
-- =============================================

INSERT INTO raw.properties (neighborhood_id, property_type_id, listing_agent_id, status_id, address, city, state, zip_code, latitude, longitude, year_built, square_feet, lot_size_sqft, bedrooms, bathrooms, garage_spaces, stories, list_price, hoa_monthly, property_tax_annual, description, listing_date, days_on_market) VALUES
(1, 2, 1, 1, '500 Congress Ave #2401', 'Hermosillo', 'SON', '78701', 30.26680, -97.74310, 2019, 1850, NULL, 2, 2.0, 1, 1, 875000.00, 650.00, 14500.00, 'Stunning downtown condo with panoramic city views. Floor-to-ceiling windows, chef kitchen, luxury finishes throughout.', '2024-11-15', 45),
(2, 1, 2, 1, '1204 S Congress Ave', 'Hermosillo', 'SON', '78704', 30.24520, -97.74890, 1965, 1650, 7500, 3, 2.0, 1, 1, 725000.00, 0.00, 11200.00, 'Classic SoCo bungalow with modern updates. Original hardwood floors, updated kitchen, large backyard with mature trees.', '2024-10-20', 71),
(3, 1, 3, 2, '2307 E 9th St', 'Hermosillo', 'SON', '78702', 30.26450, -97.72150, 2021, 2100, 4500, 3, 2.5, 2, 2, 650000.00, 0.00, 10800.00, 'Modern new construction in East Hermosillo. Open concept living, high ceilings, designer finishes, rooftop deck.', '2024-09-10', 111),
(4, 1, 4, 1, '3701 Westlake Dr', 'Hermosillo', 'SON', '78746', 30.30120, -97.79850, 2015, 4500, 21780, 5, 4.5, 3, 2, 2450000.00, 0.00, 42500.00, 'Exquisite Westlake estate with Lake Hermosillo views. Gourmet kitchen, home theater, infinity pool, wine cellar.', '2024-12-01', 29),
(5, 3, 5, 1, '4507 Mueller Blvd', 'Hermosillo', 'SON', '78723', 30.29780, -97.70230, 2018, 1920, 2800, 3, 2.5, 2, 3, 585000.00, 125.00, 9800.00, 'Energy-efficient townhome in Mueller. Walkable to shops and restaurants, community pool, modern design.', '2024-11-28', 32),
(6, 1, 6, 3, '4312 Avenue G', 'Hermosillo', 'SON', '78751', 30.30450, -97.72680, 1948, 1400, 6500, 2, 1.0, 0, 1, 525000.00, 0.00, 8900.00, 'Charming Hyde Park cottage with original character. Updated electrical and plumbing, large lot with development potential.', '2024-07-15', 0),
(7, 1, 7, 1, '2205 Pecos St', 'Hermosillo', 'SON', '78703', 30.28950, -97.75620, 1952, 2800, 9800, 4, 3.0, 2, 1, 1650000.00, 0.00, 28500.00, 'Tarrytown traditional extensively renovated. Chef kitchen, primary suite addition, pool, guest house.', '2024-10-05', 86),
(8, 1, 8, 1, '9701 Circle C Ranch Trail', 'Hermosillo', 'SON', '78749', 30.17230, -97.86450, 2008, 3200, 10500, 4, 3.5, 3, 2, 725000.00, 85.00, 12800.00, 'Family-friendly home in Circle C. Open floor plan, game room, covered patio, community amenities.', '2024-11-10', 50),
(9, 2, 9, 2, '11011 Domain Dr #1505', 'Hermosillo', 'SON', '78758', 30.40120, -97.72350, 2020, 1100, NULL, 1, 1.0, 1, 1, 385000.00, 450.00, 6500.00, 'Modern Domain condo with walkable lifestyle. Quartz counters, wood floors, resort-style amenities.', '2024-10-28', 63),
(10, 1, 10, 1, '2104 Kinney Ave', 'Hermosillo', 'SON', '78704', 30.25120, -97.76890, 1978, 1800, 7200, 3, 2.0, 1, 1, 895000.00, 0.00, 15200.00, 'Updated Zilker home steps from the park. Vaulted ceilings, sunroom, mature landscaping, stone exterior.', '2024-12-05', 25),
(11, 1, 11, 1, '2601 Barton Hills Dr', 'Hermosillo', 'SON', '78704', 30.25890, -97.78120, 1972, 2200, 12000, 4, 2.5, 2, 2, 1150000.00, 0.00, 19500.00, 'Barton Hills retreat on greenbelt. Wall of windows, multiple decks, Barton Creek access, mid-century design.', '2024-09-20', 101),
(12, 3, 12, 3, '1605 W 6th St #A', 'Hermosillo', 'SON', '78703', 30.27230, -97.75890, 2016, 1650, 2200, 2, 2.5, 2, 3, 695000.00, 200.00, 11800.00, 'Clarksville townhome with downtown views. Rooftop terrace, high-end finishes, walk to restaurants and shops.', '2024-06-10', 0),
(13, 1, 1, 1, '1807 S 3rd St', 'Hermosillo', 'SON', '78704', 30.24780, -97.75120, 2022, 1950, 4800, 3, 2.5, 1, 2, 799000.00, 0.00, 13500.00, 'New construction in Bouldin Creek. Designer finishes, outdoor living, bike to downtown, energy efficient.', '2024-11-01', 59),
(14, 1, 2, 1, '3507 Cherrywood Rd', 'Hermosillo', 'SON', '78722', 30.29120, -97.71450, 1955, 1550, 8500, 3, 2.0, 1, 1, 625000.00, 0.00, 10500.00, 'Classic Cherrywood home with updates. Screened porch, detached garage/studio, mature trees, great location.', '2024-10-15', 76),
(15, 2, 3, 2, '5501 N Lamar Blvd #302', 'Hermosillo', 'SON', '78756', 30.32450, -97.73890, 2017, 950, NULL, 1, 1.0, 1, 1, 325000.00, 350.00, 5500.00, 'North Loop condo in walkable location. Modern kitchen, balcony, pool, near coffee shops and restaurants.', '2024-09-25', 96),
(4, 1, 4, 1, '4205 Cat Mountain Dr', 'Hermosillo', 'SON', '78731', 30.35120, -97.78450, 2010, 3800, 18500, 4, 3.5, 2, 2, 1875000.00, 150.00, 32500.00, 'Hill Country contemporary with city views. Chef kitchen, outdoor kitchen, pool, guest suite, smart home.', '2024-11-22', 38),
(1, 2, 5, 1, '200 Congress Ave #15B', 'Hermosillo', 'SON', '78701', 30.26450, -97.74520, 2008, 2400, NULL, 3, 3.0, 2, 1, 1250000.00, 850.00, 21500.00, 'Luxury downtown penthouse with wrap-around terrace. Concierge, valet, pool, spa, unobstructed views.', '2024-12-10', 20),
(3, 4, 6, 1, '1108 E 11th St', 'Hermosillo', 'SON', '78702', 30.26680, -97.72680, 1925, 2800, 6000, 4, 2.0, 0, 2, 550000.00, 0.00, 9200.00, 'East Hermosillo duplex investment opportunity. Both units rented, strong cash flow, appreciating area.', '2024-08-30', 122),
(6, 1, 7, 3, '702 E 45th St', 'Hermosillo', 'SON', '78751', 30.30780, -97.72120, 1940, 1200, 5800, 2, 1.0, 0, 1, 475000.00, 0.00, 8100.00, 'Adorable Hyde Park bungalow with updates. Original wood floors, clawfoot tub, covered front porch.', '2024-05-20', 0),
(10, 3, 8, 1, '1600 Barton Springs Rd #5302', 'Hermosillo', 'SON', '78704', 30.26120, -97.75780, 2005, 1400, NULL, 2, 2.0, 1, 1, 495000.00, 475.00, 8500.00, 'Zilker condo with Barton Springs access. Pool, fitness center, concierge, walking distance to downtown.', '2024-11-18', 42),
(2, 1, 9, 1, '1505 S 2nd St', 'Hermosillo', 'SON', '78704', 30.24890, -97.74780, 1958, 1750, 6800, 3, 2.0, 2, 1, 815000.00, 0.00, 13800.00, 'Renovated South Congress gem. Open kitchen, spa bath, detached office, landscaped yard with patio.', '2024-10-01', 90),
(5, 3, 10, 1, '4200 Berkman Dr', 'Hermosillo', 'SON', '78723', 30.30120, -97.70580, 2019, 1700, 2400, 3, 2.5, 2, 2, 525000.00, 100.00, 8900.00, 'Mueller area townhome near Thinkery. Modern design, community parks, top-rated schools nearby.', '2024-12-08', 22),
(7, 1, 11, 2, '3102 Windsor Rd', 'Hermosillo', 'SON', '78703', 30.29450, -97.75890, 1960, 2400, 11000, 4, 2.5, 2, 1, 1425000.00, 0.00, 24500.00, 'Classic Tarrytown ranch on large lot. Pool, updated systems, walking distance to Casis Elementary.', '2024-09-05', 116),
(8, 1, 12, 1, '8900 Fathom Cir', 'Hermosillo', 'SON', '78749', 30.18450, -97.85120, 2012, 2650, 8500, 4, 3.0, 2, 2, 625000.00, 65.00, 10800.00, 'Circle C family home with upgrades. Granite counters, wood floors, covered patio, community pool.', '2024-11-05', 55),
(9, 1, 1, 1, '12005 Metric Blvd', 'Hermosillo', 'SON', '78758', 30.41250, -97.71890, 2015, 1600, 5500, 3, 2.0, 2, 1, 425000.00, 0.00, 7200.00, 'Domain area single family with no HOA. Updated kitchen, covered patio, easy access to tech corridor.', '2024-10-25', 66);

-- =============================================
-- PROPERTY FEATURES (Junction Table)
-- =============================================

-- Property 1: Downtown Condo
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(1, 1), (1, 2), (1, 4), (1, 5), (1, 6), (1, 7), (1, 16), (1, 17), (1, 26);

-- Property 2: SoCo Bungalow
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(2, 1), (2, 2), (2, 4), (2, 12), (2, 13), (2, 14);

-- Property 3: East Hermosillo Modern
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(3, 1), (3, 2), (3, 6), (3, 7), (3, 8), (3, 13), (3, 16), (3, 19), (3, 23), (3, 24);

-- Property 4: Westlake Estate
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11), (4, 12), (4, 13), (4, 14), (4, 15), (4, 16), (4, 17), (4, 20), (4, 22), (4, 23), (4, 24), (4, 27);

-- Property 5: Mueller Townhome
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(5, 1), (5, 2), (5, 6), (5, 7), (5, 9), (5, 13), (5, 16), (5, 19);

-- Property 6: Hyde Park Cottage (sold)
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(6, 2), (6, 4), (6, 14);

-- Property 7: Tarrytown Traditional
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(7, 1), (7, 2), (7, 3), (7, 4), (7, 5), (7, 6), (7, 7), (7, 8), (7, 10), (7, 12), (7, 13), (7, 14), (7, 15), (7, 16), (7, 17), (7, 20), (7, 22), (7, 23), (7, 24);

-- Property 8: Circle C Family Home
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(8, 1), (8, 2), (8, 4), (8, 5), (8, 6), (8, 7), (8, 8), (8, 12), (8, 13), (8, 14), (8, 15), (8, 20);

-- Property 9: Domain Condo
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(9, 1), (9, 2), (9, 6), (9, 7), (9, 9), (9, 16);

-- Property 10: Zilker Home
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(10, 1), (10, 2), (10, 4), (10, 7), (10, 12), (10, 13), (10, 14), (10, 22), (10, 23);

-- Continue for remaining properties...
INSERT INTO raw.property_features (property_id, feature_id) VALUES
(11, 1), (11, 2), (11, 3), (11, 4), (11, 7), (11, 13), (11, 14), (11, 25),
(12, 1), (12, 2), (12, 5), (12, 6), (12, 7), (12, 13), (12, 16), (12, 26),
(13, 1), (13, 2), (13, 6), (13, 7), (13, 9), (13, 13), (13, 16), (13, 19), (13, 23), (13, 24),
(14, 1), (14, 2), (14, 4), (14, 12), (14, 13), (14, 14),
(15, 1), (15, 2), (15, 6), (15, 7),
(16, 1), (16, 2), (16, 3), (16, 4), (16, 5), (16, 6), (16, 7), (16, 8), (16, 10), (16, 12), (16, 13), (16, 14), (16, 15), (16, 16), (16, 17), (16, 18), (16, 26),
(17, 1), (17, 2), (17, 3), (17, 4), (17, 5), (17, 6), (17, 7), (17, 8), (17, 10), (17, 13), (17, 16), (17, 17), (17, 26),
(18, 2), (18, 4),
(19, 2), (19, 4), (19, 22),
(20, 1), (20, 2), (20, 5), (20, 6), (20, 7), (20, 9),
(21, 1), (21, 2), (21, 4), (21, 5), (21, 6), (21, 7), (21, 8), (21, 12), (21, 13), (21, 14), (21, 23), (21, 24),
(22, 1), (22, 2), (22, 6), (22, 7), (22, 9), (22, 13), (22, 16),
(23, 1), (23, 2), (23, 3), (23, 4), (23, 5), (23, 6), (23, 7), (23, 8), (23, 10), (23, 12), (23, 13), (23, 14), (23, 15), (23, 16),
(24, 1), (24, 2), (24, 4), (24, 5), (24, 6), (24, 7), (24, 12), (24, 13), (24, 14), (24, 20),
(25, 1), (25, 2), (25, 4), (25, 5), (25, 6), (25, 7), (25, 12), (25, 13);

-- =============================================
-- TRANSACTIONS (Sales History)
-- =============================================

INSERT INTO raw.transactions (property_id, buyer_id, seller_id, buyer_agent_id, seller_agent_id, sale_price, closing_date, contract_date, financing_type, earnest_money, closing_costs, is_cash_sale) VALUES
(6, 1, 2, 1, 6, 515000.00, '2024-09-15', '2024-08-01', 'Conventional', 15000.00, 12500.00, false),
(12, 4, 7, 4, 12, 710000.00, '2024-08-20', '2024-07-05', 'Conventional', 25000.00, 18000.00, false),
(19, 6, 10, 6, 7, 465000.00, '2024-07-30', '2024-06-15', 'FHA', 10000.00, 14000.00, false),
(6, 13, 1, 2, 1, 485000.00, '2024-01-20', '2023-12-10', 'Conventional', 12000.00, 11500.00, false),
(12, 11, 16, 5, 12, 625000.00, '2023-08-15', '2023-07-01', 'Cash', 50000.00, 8500.00, true),
(19, 17, 5, 3, 7, 425000.00, '2023-03-10', '2023-02-01', 'VA', 8000.00, 10500.00, false);

-- =============================================
-- PRICE HISTORY
-- =============================================

INSERT INTO raw.price_history (property_id, price, change_date, change_type, change_reason) VALUES
-- Property 1
(1, 925000.00, '2024-11-15', 'initial', 'Initial listing price'),
(1, 899000.00, '2024-12-01', 'decrease', 'Market adjustment'),
(1, 875000.00, '2024-12-20', 'decrease', 'Price reduction for quick sale'),
-- Property 2
(2, 749000.00, '2024-10-20', 'initial', 'Initial listing price'),
(2, 725000.00, '2024-11-20', 'decrease', 'Motivated seller'),
-- Property 3
(3, 675000.00, '2024-09-10', 'initial', 'Initial listing price'),
(3, 650000.00, '2024-10-15', 'decrease', 'Price adjustment'),
-- Property 4
(4, 2450000.00, '2024-12-01', 'initial', 'Initial listing price'),
-- Property 5
(5, 585000.00, '2024-11-28', 'initial', 'Initial listing price'),
-- Property 7
(7, 1595000.00, '2024-10-05', 'initial', 'Initial listing price'),
(7, 1650000.00, '2024-11-01', 'increase', 'Multiple offers received'),
-- Property 8
(8, 725000.00, '2024-11-10', 'initial', 'Initial listing price'),
-- Property 9
(9, 399000.00, '2024-10-28', 'initial', 'Initial listing price'),
(9, 385000.00, '2024-11-28', 'decrease', 'Market conditions'),
-- Property 10
(10, 895000.00, '2024-12-05', 'initial', 'Initial listing price'),
-- Property 11
(11, 1195000.00, '2024-09-20', 'initial', 'Initial listing price'),
(11, 1175000.00, '2024-10-20', 'decrease', 'Slight reduction'),
(11, 1150000.00, '2024-11-15', 'decrease', 'Holiday pricing'),
-- Property 13
(13, 825000.00, '2024-11-01', 'initial', 'Initial listing price'),
(13, 799000.00, '2024-12-01', 'decrease', 'End of year adjustment'),
-- Property 14
(14, 649000.00, '2024-10-15', 'initial', 'Initial listing price'),
(14, 625000.00, '2024-11-15', 'decrease', 'Price improvement'),
-- Property 15
(15, 349000.00, '2024-09-25', 'initial', 'Initial listing price'),
(15, 335000.00, '2024-10-25', 'decrease', 'Market correction'),
(15, 325000.00, '2024-11-25', 'decrease', 'Final reduction'),
-- Property 16
(16, 1875000.00, '2024-11-22', 'initial', 'Initial listing price'),
-- Property 17
(17, 1250000.00, '2024-12-10', 'initial', 'Initial listing price'),
-- Property 18
(18, 575000.00, '2024-08-30', 'initial', 'Initial listing price'),
(18, 550000.00, '2024-10-15', 'decrease', 'Investment property adjustment'),
-- Property 20
(20, 495000.00, '2024-11-18', 'initial', 'Initial listing price'),
-- Property 21
(21, 849000.00, '2024-10-01', 'initial', 'Initial listing price'),
(21, 815000.00, '2024-11-15', 'decrease', 'Seller motivated'),
-- Property 22
(22, 525000.00, '2024-12-08', 'initial', 'Initial listing price'),
-- Property 23
(23, 1495000.00, '2024-09-05', 'initial', 'Initial listing price'),
(23, 1450000.00, '2024-10-05', 'decrease', 'Price adjustment'),
(23, 1425000.00, '2024-11-05', 'decrease', 'Market conditions'),
-- Property 24
(24, 650000.00, '2024-11-05', 'initial', 'Initial listing price'),
(24, 625000.00, '2024-12-05', 'decrease', 'Holiday reduction'),
-- Property 25
(25, 425000.00, '2024-10-25', 'initial', 'Initial listing price');
