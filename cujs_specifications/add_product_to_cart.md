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

**Specification**: Proportion of add cart requests (POST /cart) that were served with response code 2XX, 3XX or 4XX (excl. 429) measured at the ____________.

**Implementation**
* [Potential SLI implementation]
    - pros
    - cons
* [Another potential implementation]
    - pros
    - cons

**Good events**

- All `POST /cart` requests

**Valid events**

- Response status 2xx, 3xx and 4xx excl. 429

**SLO**: 99.5% of requests served with good events in the past 28 days

<br/>

---

## **Service Level Indicators**

### SLI : Add product to cart latancy

**Type**: Latency

**Specification**: Proportion of add cart requests (POST /cart) that were served within 300ms measured at the ____________.

**Implementation**
* [Potential SLI implementation]
    - pros
    - cons
* [Another potential implementation]
    - pros
    - cons

**Good events**

- All `POST /cart` requests

**Valid events**

- Served within 300ms

**SLO**: 99% of requests served with good events in the past 28 days

<br/>
