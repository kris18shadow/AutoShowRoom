using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace AutoShowRoom
{
    public partial class InputForm : System.Web.UI.Page
    {
        Model1 context = new Model1();

        List<Car> cars; // = new List<Car>();
        List<Employee> employees; // = new List<Employee>();
        List<Order> orders; // = new List<Order>();

        protected void Page_Load(object sender, EventArgs e)
        {
            cars = ViewState["cars"] as List<Car>;
            if (cars == null)
            {
                cars = new List<Car>();
                ViewState["cars"] = cars;
            }

            employees = ViewState["employees"] as List<Employee>;
            if (employees == null)
            {
                employees = new List<Employee>();
                ViewState["employees"] = employees;
            }

            orders = ViewState["orders"] as List<Order>;
            if (orders == null)
            {
                orders = new List<Order>();
                ViewState["orders"] = orders;
            }
        }

        
               

        private const string DTD = "AutoShowRoom.dtd";
        private const string ROOT_ELEMENT = "auto-showroom";
        private const string NAME_ELEMENT = "showroomName";

        //Car
        private const string CARS_ELEMENT = "cars";
        private const string CAR_ELEMENT = "car";
        private const string BRAND_ELEMENT = "brand";
        private const string MODEL_ELEMENT = "model";
        private const string POWER_ELEMENT = "power";
        private const string FUEL_ELEMENT = "fuel";
        private const string DESCRIPTION_ELEMENT = "description";
        private const string CLASS_ELEMENT = "class";
        private const string PRICE_ELEMENT = "price";
        private const string COLOR_ELEMENT = "color";
        private const string WEIGHT_ELEMENT = "weight";
        private const string SAFETYRATING_ELEMENT = "safety-rating";
        private const string SEATS_ELEMENT = "seats";

        //Car attributes
        private const string CARID_ATTRIBUTE = "car-id";
        private const string CARADDEDBY_ATTRIBUTE = "added-by";
        private const string INSTOCK_ATTRIBUTE = "in-stock";
        private const string NEW_ATTRIBUTE = "new";
        private const string TOTALORDERS_ATTRIBUTE = "total-orders";
        private const string COUNTRYOFORIGIN_ATTRIBUTE = "country-of-origin";

        //Employee
        private const string EMPLOYEES_ELEMENT = "employees";
        private const string EMPLOYEE_ELEMENT = "employee";
        private const string ORDERS_ELEMENT = "orders";
        private const string ORDER_ELEMENT = "order";
        private const string EMPLOYEENAME_ELEMENT = "employee-name";
        private const string EMPLOYEESALARY_ELEMENT = "employee-salary";
        private const string EMPLOYEEPOSITION_ELEMENT = "employee-position";

        //Employee attributes
        private const string EMPLOYEEID_ATTRIBUTE = "employee-id";


        //Order
        private const string ORDERDATE_ELEMENT = "order-date";
        private const string TOTALPRICE_ELEMENT = "total-price";

        //Order attributes
        private const string ORDERID_ATTRIBUTE = "order-id";
        private const string ORDEREDPRODUCTS_ATTRIBUTE = "ordered-products";
        private const string PROCESSEDBY_ATTRIBUTE = "proceseed-by";

        //Client
        private const string CLIENTINFO_ELEMENT = "client-info";
        private const string CLIENTNAME_ELEMENT = "client-name";
        private const string CLIENTTELEPHONE_ELEMENT = "client-telephone";
        private const string CLIENTADDRESS_ELEMENT = "client-address";
        private const string CITY_ELEMENT = "city";
        private const string ADDRESS_ELEMENT = "address";

        

        private XDocument ExportXml(AutoShowRoom carShop)
        {
            var doc = new XDocument(new XDocumentType("AutoShowRoom", null, "AutoShowRoom.dtd", null));

            XElement root = new XElement("auto-showroom");
            root.Add(new XElement("showroomName", carShop.Name));
           
            root.Add(new XElement("cars"));
            root.Add(new XElement("employees"));
            root.Add(new XElement("orders"));

            XElement elem = root.Element("cars");
            XElement car = null;
            foreach (var item in carShop.Car)
            {
                car = new XElement("car");
                car.SetAttributeValue("car-id", item.carID);
                car.SetAttributeValue("added-by", item.addedBy);
                car.SetAttributeValue("in-stock", item.inStock);
                car.SetAttributeValue("new", item._new);
                car.SetAttributeValue("total-orders", item.totalOrders);
                car.SetAttributeValue("country-of-origin", item.countryOfOrigin);
                
                car.Add(new XElement("brand", item.brand));
                car.Add(new XElement("model", item.model));
                car.Add(new XElement("power", item.power));
                car.Add(new XElement("fuel", item.fuel));
                if(item.description != null)
                    car.Add(new XElement("description", item.description));
                else
                    car.Add(new XElement("description", ""));
                car.Add(new XElement("class", item._class));
                car.Add(new XElement("price", item.price));
                car.Add(new XElement("color", item.color));
                car.Add(new XElement("weight", item.weight));
                car.Add(new XElement("safety-rating", item.safetyRating));
                car.Add(new XElement("seats", item.seats));

                elem.Add(car);

            }

            elem = root.Element("employees");
            XElement employee = null;
            foreach (var item in carShop.Employee)
            {
                employee = new XElement("employee");
                employee.SetAttributeValue("employee-id", item.employeeID);

                employee.Add(new XElement("employee-name", item.name));
                employee.Add(new XElement("employee-salary", item.salary));
                employee.Add(new XElement("employee-position", item.position));
                
                elem.Add(employee);
            }

            elem = root.Element("orders");
            XElement order = null;
            foreach (var item in carShop.Order)
            {
                order = new XElement("order");
                order.SetAttributeValue("order-id", item.orderID);
                order.SetAttributeValue("ordered-products", item.orderedProducts);
                order.SetAttributeValue("processed-by", item.processedBy);
                
                order.Add(new XElement("order-date", item.date));
                car.Add(new XElement("total-price", item.price));

                XElement clientInfo = new XElement("client-info");
                clientInfo.Add(new XElement("client-telephone", item.ClientInfo1.telephone));
                clientInfo.Add(new XElement("client-name", item.ClientInfo1.Name));

                XElement clientAddress = new XElement("client-address");
                clientAddress.Add(new XElement("city", "София"));
                clientAddress.Add(new XElement("address", "жк.Дружба, бл127А ет.1"));

                clientInfo.Add(clientAddress);
                order.Add(clientInfo);

                elem.Add(order);
            }

            doc.Add(root);

            return doc;
        }

        protected AutoShowRoom ControlsToModel()
        {
            AutoShowRoom showRoom = null;
            upsert_AutoShowRoom(out showRoom);

            foreach (var enteredCar in cars)
            {
                var car = new Car()
                {
                    carID = enteredCar.carID,
                    addedBy = enteredCar.addedBy,
                    inStock = enteredCar.inStock,
                    _new = enteredCar._new,
                    totalOrders = enteredCar.totalOrders,
                    countryOfOrigin = enteredCar.countryOfOrigin,
                    brand = enteredCar.brand,
                    model = enteredCar.model,
                    power = enteredCar.power,
                    fuel = enteredCar.fuel,
                    description = enteredCar.description,
                    _class = enteredCar._class,
                    price = enteredCar.price,
                    color = enteredCar.color,
                    weight = enteredCar.weight,
                    safetyRating = enteredCar.safetyRating,
                    seats = enteredCar.seats,
                    showroomID = showRoom.showroomID,

                };
                showRoom.Car.Add(car);
            }

            foreach (var enteredEmployee in employees)
            {
                var employee = new Employee()
                {
                    employeeID = enteredEmployee.employeeID,
                    name = enteredEmployee.name,
                    salary = enteredEmployee.salary,
                    position = enteredEmployee.position,
                    showroomID = showRoom.showroomID
                };
                showRoom.Employee.Add(employee);
            }

            foreach (var enteredOrder in orders)
            {
                var order = new Order();
                order.orderID = enteredOrder.orderID;
                order.orderedProducts = enteredOrder.orderedProducts;
                foreach (Car car in cars)
                {
                    if (order.orderedProducts == car.carID)
                        car.orderID = order.orderID;
                }
                order.processedBy = enteredOrder.processedBy;
                order.date = enteredOrder.date;
                order.price = enteredOrder.price;
                order.clientInfo = "added";
                order.showroomID = showRoom.showroomID;

                order.ClientInfo1 = new ClientInfo();
                order.ClientInfo1.Name = enteredOrder.ClientInfo1.Name;
                order.ClientInfo1.Address = "added";
                order.ClientInfo1.telephone = enteredOrder.ClientInfo1.telephone;
                order.ClientInfo1.OrderID = (Guid.NewGuid().ToString("N")).Substring(0, 9);

                ClientAddress temp = new ClientAddress();
                temp.City = "София";
                temp.ClientInfoID = order.ClientInfo1.OrderID;
                temp.adress = "жк.Дружба, бл127А ет.1";

                order.ClientInfo1.ClientAddress.Add(temp);

                showRoom.Order.Add(order);
            }


            return showRoom;
        }

        private bool upsert_AutoShowRoom(out AutoShowRoom showRoom)
        {
            bool correct = false;
            showRoom = null;
            if (!string.IsNullOrEmpty(AutoShowRoomID_Input.Text))
            {
                showRoom = context.AutoShowRoom.FirstOrDefault(ahr => ahr.Name == AutoShowRoomID_Input.Text);
                if (showRoom == null)
                {
                    showRoom = new AutoShowRoom();

                    showRoom.showroomID = "ID" + AutoShowRoomID_Input.Text;
                    showRoom.Name = AutoShowRoomID_Input.Text;
                }
                correct = true;
            }
            return correct;
        }

        protected void saveChanges_Click(object sender, EventArgs e)
        {
            AutoShowRoom showRoom = new AutoShowRoom();
            
            showRoom = ControlsToModel();
            context.AutoShowRoom.Add(showRoom);
            context.SaveChanges();            
        }


        public void CarListView_InsertItem()
        {
            AutoShowRoom showRoom = null;
            if(upsert_AutoShowRoom(out showRoom))
            { 
                var item = new Car();
                TryUpdateModel(item);
                item.showroomID = showRoom.showroomID;
                cars.Add(item);
            }
        }

        public IQueryable<Car> CarListView_GetData()
        {
            return context.Car.AsQueryable();
        }

        public void CarListView_DeleteItem(string Id)
        {
            cars.Remove(cars.Single(c => c.carID == Id));
        }



        public void EmployeeListView_InsertItem()
        {
            var item = new Employee();
            item.showroomID = "ID" + AutoShowRoomID_Input.Text;
            TryUpdateModel(item);

            employees.Add(item);
        }
                
        public void EmployeeListView_DeleteItem(string Id)
        {
            employees.Remove(employees.Single(c => c.employeeID == Id));
        }

        

        public IQueryable<Employee> EmployeeListView_GetData()
        {
            return context.Employee.AsQueryable();
        }

        public void OrderListView_InsertItem()
        {
            var item = new Order();
            item.showroomID = "ID" + AutoShowRoomID_Input.Text;
            item.clientInfo = "added";
            TryUpdateModel(item);
            orders.Add(item);
        }

        public void OrderListView_DeleteItem(string Id)
        {
            orders.Remove(orders.Single(c => c.orderID == Id));
        }
        

        public IQueryable<Order> OrderListView_GetData()
        {
            return context.Order.AsQueryable();
        }

        protected void CarListView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}