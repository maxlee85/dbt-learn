### Common data models
#### transactional fact table (retail)
- A transaction fact table is as described. For example, in a sales example, every transaction recorded at the point of sale.
  - <img width="655" alt="image" src="https://user-images.githubusercontent.com/77996369/198893291-7a495d06-50d7-4209-b2cd-e02093c19977.png">
- factless fact table (retail)
  - A factless fact table does not contain any facts but instead represents all the potential possibilities. This can be used to calculate the products on promotion that were not sold.
  - <img width="657" alt="image" src="https://user-images.githubusercontent.com/77996369/201542914-ed97d5bd-8ede-4832-a9a0-ee3e84502471.png">
#### periodic snapshot (inventory management)
- A table that provides insight into how much inventory is present at the start of everyday
  - <img width="652" alt="image" src="https://user-images.githubusercontent.com/77996369/201543405-81a75e66-5ccd-4a8b-aa01-76027fae91f1.png">
  - In this model there is the introduction of semi additive facts. You cannot SUM(quantity_on_hand) to get the total number of products present.
- a transactional fact table can also be used in invetory management where each row in the table represents the movement of an item in the inventory
  - <img width="666" alt="image" src="https://user-images.githubusercontent.com/77996369/201543586-6c6e429d-7019-4c37-aba4-8ea06f9126d6.png">
  - This model can calculate the velocity or volumne of products but is unable to paint the same picture like the periodic snapshot that can show the amount of inventory on hand at a certain time.
#### accumulating snapshot - for business processes that have a defined start and end with milestones in between.
  - <img width="659" alt="image" src="https://user-images.githubusercontent.com/77996369/201543714-316bf14b-b01c-4011-a442-9a78c6b5ae13.png">
  - In this model there is 1 row per inventory and dates that correspond when that piece of inventory passed through a certain step. As a piece of inventory passes through a step the date column is filled in and as well as the quantity of the product.
#### a quick recap of the types of fact tables and when to use them
- <img width="664" alt="image" src="https://user-images.githubusercontent.com/77996369/201543770-a797364d-9b39-4925-918c-a2337c652b85.png">
- transaction - 1 row per action that occurred
  - for releated by not identical transactions should a single fact table be used or multiple?
    - will it be too much work to conform columns from each transaction?
    - will each fact have a seperate set of dimensions?
- periodic snapshot - a view of the business process at a point in time
- accumulating snapshot - for processes that have a definitive start and end with milestones in between
- note that these tables need to be used in conjunction to paint a complete picture of a business. ie a periodic snapshot can point out the health of a business at a point in time but the transactional table will contain the events in between.
