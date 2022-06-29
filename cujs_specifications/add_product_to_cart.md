# User Journey: Add Product to Cart

Users add products to cart to potentially order them.

![diagram](img/add_product_to_cart.png "Add Product to Cart Sequence")

<br/>

## **Assumptions**

* Add product to cart automatically redirects you to cart view page.
* [Here](view_cart.md) you can find Cart View Service Level Indicators.

---

<br/>

## **Service Level Indicators**

### SLI : Add product to cart availability

**Type**: Availability

**Specification**: Proportion of add cart requests (POST /cart) that were served with response code 3XX or 4XX (excl. 429) measured at the ingress gateway.

**Implementation**
* **Load Balancer (Ingress gateway)**
    - pros
        - Cheap and easy
        - Centralized gateway
        - Closest to the customer within infrastructure
    - cons
        - frontend issues affects measurement
        - Does not capture failures on Load Balancer

* **FE Container logs**
    - pros
        - logs readily available
        - 
    - cons
        - does not capture failures in the FE service
        - Does not capture failures on Load Balancer
        - requires a log metric

* **Measured at client with telemetry**
    - pros
        - Closest to a real-user experience
    - cons
        - Needs consent
        - External factors may impact

**Valid events**

- All `POST /cart` requests

**Good events**

- Response status 3xx and 4xx excl. 429

**SLO**: 99.9% of requests served with good events in the past 28 days

<br/>

---

### SLI : Add product to cart quickly response

**Type**: Latency

**Specification**: Proportion of add cart requests (POST /cart) that were served within 300ms measured at the ingress gateway.

* **Load Balancer (Ingress gateway)**
    - pros
        - Cheap and easy
        - Centralized gateway
        - Closest to the customer within infrastructure
    - cons
        - frontend issues affects measurement
        - Does not capture failures on Load Balancer

* **FE Container logs**
    - pros
        - logs readily available
        - 
    - cons
        - does not capture failures in the FE service
        - Does not capture failures on Load Balancer
        - requires a log metric

* **Measured at client with telemetry**
    - pros
        - Closest to a real-user experience
    - cons
        - Needs consent
        - External factors may impact


**Valid events**

- All `POST /cart` requests

**Good events**

- Served within 300ms

**SLO**: 99.5% of requests served with good events in the past 28 days

<br/>


---

### SLI : Add product to cart button effectively added the item(s) into user's cart

**Type**: Quality

**Specification**: Proportion of add product(s) to cart requests (POST /cart) that effectively added requested product(s) to user's cart measured by a synthetic client every 30s.

* **Measured at syntectic client**
    - pros
        - Outside the infrastructure
        - measure all steps of journey
    - cons
        - Engineering effort to create and maintain
        - Not the real user experience 

* **Cart Container logs**
    - pros
        - logs can be processed retroactively
        - Closer user experience
        - Can write complex queries/parsing to validate behavior 
    - cons
        - Async analisys
        - Hard to process async information because of Redis volatility
        - Does not contain logs which didn't reach the service

* **Client Instrumentation**
    - pros
        - Accurate user experience
        - Can quantify reliability of third parties
    - cons
        - Engineering effort to create and maintain
        - Hard to process async information because of Redis volatility
        - Users consent

**Valid events**

- All add product(s) to cart requests (`POST /cart` requests)

**Good events**

- Effectively added requested product(s) to user's cart.

**SLO**: 95% of requests served with good events in the past 7 days

<br/>
