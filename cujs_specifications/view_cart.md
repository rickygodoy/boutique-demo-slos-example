# User Journey: View Cart

User navigates to the view cart page to visualize products to potentially order.

![diagram](img/view_cart.png "View Cart Sequence")

<br/>

## **Service Level Indicators**

### SLI : View cart availability

**Type**: Availability

**Specification**: Proportion of get cart requests (GET /cart) that were served with response code 2XX, 3XX or 4XX (excl. 429) measured at the ingress gateway.

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

- All `GET /cart` requests

**Good events**

- Response status 2xx, 3xx and 4xx excl. 429

**SLO**: 99.9% of requests served with good events in the past 28 days

<br/>

---

### SLI : View cart quickly response

**Type**: Latency

**Specification**: Proportion of get cart requests (GET /cart) that were served within 500ms measured at the ingress gateway.

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

- All `GET /cart` requests

**Good events**

- Served within 500ms

**SLO**: 99.5% of requests served with good events in the past 28 days

<br/>
