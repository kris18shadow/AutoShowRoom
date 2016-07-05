using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Xml;
using System.Xml.Schema;
using System.IO;
using System.Xml.Linq;


namespace AutoShowRoom
{

    public partial class XmltoDb : System.Web.UI.Page
    {
        Model1 context = new Model1();

        //List<Car> cars;

        //XML elements and atributes:
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
        private const string PROCESSEDBY_ATTRIBUTE = "processed-by";

        //Client
        private const string CLIENTINFO_ELEMENT = "client-info";
        private const string CLIENTNAME_ELEMENT = "client-name";
        private const string CLIENTTELEPHONE_ELEMENT = "client-telephone";
        private const string CLIENTADDRESS_ELEMENT = "client-address";
        private const string CITY_ELEMENT = "city";
        private const string ADDRESS_ELEMENT = "address";


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        private AutoShowRoom XmlToModel(XmlDocument doc)
        {
            var autoshowroomXml = doc.SelectSingleNode(ROOT_ELEMENT);
            var autoshowroom = new AutoShowRoom();
            autoshowroom.Name = autoshowroomXml.SelectSingleNode(NAME_ELEMENT).InnerText;
            autoshowroom.showroomID = ("ID" + autoshowroomXml.SelectSingleNode(NAME_ELEMENT).InnerText).Substring(0, 9);

            foreach (XmlNode carsXml in autoshowroomXml.SelectNodes("cars/car"))
            {
                var car = new Car();

                //attributes:
                car.carID = carsXml.Attributes[CARID_ATTRIBUTE].InnerText;
                car.addedBy = carsXml.Attributes[CARADDEDBY_ATTRIBUTE].InnerText;
                car.inStock = carsXml.Attributes[INSTOCK_ATTRIBUTE].InnerText;
                car._new = carsXml.Attributes[NEW_ATTRIBUTE].InnerText;
                car.totalOrders = Int32.Parse(carsXml.Attributes[TOTALORDERS_ATTRIBUTE].InnerText);
                car.countryOfOrigin = carsXml.Attributes[COUNTRYOFORIGIN_ATTRIBUTE].InnerText;
                //elements:
                car.brand = carsXml.SelectSingleNode(BRAND_ELEMENT).InnerText;
                car.model = carsXml.SelectSingleNode(MODEL_ELEMENT).InnerText;
                car.power = carsXml.SelectSingleNode(POWER_ELEMENT).InnerText;
                car.fuel = carsXml.SelectSingleNode(FUEL_ELEMENT).InnerText;
                car.description = carsXml.SelectSingleNode(DESCRIPTION_ELEMENT).InnerText;
                car._class = carsXml.SelectSingleNode(CLASS_ELEMENT).InnerText;
                car.price = carsXml.SelectSingleNode(PRICE_ELEMENT).InnerText;
                car.color = carsXml.SelectSingleNode(COLOR_ELEMENT).InnerText;
                car.weight = carsXml.SelectSingleNode(WEIGHT_ELEMENT).InnerText;
                car.safetyRating = carsXml.SelectSingleNode(SAFETYRATING_ELEMENT).InnerText;
                car.seats = Int32.Parse(carsXml.SelectSingleNode(SEATS_ELEMENT).InnerText);

                car.showroomID = autoshowroom.showroomID;

                autoshowroom.Car.Add(car);
            }

            foreach (XmlNode employeesXml in autoshowroomXml.SelectNodes("employees/employee"))
            {
                var employee = new Employee();

                //attributes:
                employee.employeeID = employeesXml.Attributes[EMPLOYEEID_ATTRIBUTE].InnerText;
                //elements:
                employee.name = employeesXml.SelectSingleNode(EMPLOYEENAME_ELEMENT).InnerText;
                employee.salary = employeesXml.SelectSingleNode(EMPLOYEESALARY_ELEMENT).InnerText;
                employee.position = employeesXml.SelectSingleNode(EMPLOYEEPOSITION_ELEMENT).InnerText;

                employee.showroomID = autoshowroom.showroomID;

                autoshowroom.Employee.Add(employee);
            }

            foreach (XmlNode orderXml in autoshowroomXml.SelectNodes("orders/order"))
            {
                var order = new Order();

                //attributes:
                order.orderID = orderXml.Attributes[ORDERID_ATTRIBUTE].InnerText;
                order.orderedProducts = orderXml.Attributes[ORDEREDPRODUCTS_ATTRIBUTE].InnerText;
                //adding orderID to car:
                foreach (Car car in autoshowroom.Car)
                {
                    if (order.orderedProducts == car.carID)
                        car.orderID = order.orderID;
                }

                order.processedBy = orderXml.Attributes[PROCESSEDBY_ATTRIBUTE].InnerText;

                //elements:
                order.date = DateTime.ParseExact(orderXml.SelectSingleNode(ORDERDATE_ELEMENT).InnerText, "dd.mm.yyyy", System.Globalization.CultureInfo.InvariantCulture);
                order.price = orderXml.SelectSingleNode(TOTALPRICE_ELEMENT).InnerText;

                order.ClientInfo1 = new ClientInfo();
                order.ClientInfo1.Name = orderXml.SelectSingleNode("client-info/client-name").InnerText;
                order.ClientInfo1.telephone = orderXml.SelectSingleNode("client-info/client-telephone").InnerText;
                order.ClientInfo1.Address = "added";
                //order.ClientInfo1.OrderID = order.orderID;
                order.ClientInfo1.OrderID = (Guid.NewGuid().ToString("N")).Substring(0, 9);

                ClientAddress temp = new ClientAddress();
                temp.City = orderXml.SelectSingleNode("client-info/client-address/city").InnerText;
                temp.ClientInfoID = order.ClientInfo1.OrderID;
                temp.adress = orderXml.SelectSingleNode("client-info/client-address/address").InnerText;

                order.clientInfo = "added";
                order.ClientInfo1.ClientAddress.Add(temp);

                order.showroomID = autoshowroom.showroomID;

                autoshowroom.Order.Add(order);
            }
            return autoshowroom;
        }

        private void addStatusToTable(String filename, String status, bool success)
        {
            TableRow fileRow = new TableRow();
            fileRow.Cells.Add(new TableCell() { Text = Path.GetFileName(filename) });
            fileRow.Cells.Add(new TableCell() { Text = " – " + status, ForeColor = success ? Color.ForestGreen : Color.Red });
            StatusTable.Rows.Add(fileRow);
        }

        private void alert(String alert)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + alert + "');", true);
        }

        public IQueryable<AutoShowRoom> AutoshowroomsGridView_GetData()
        {
            return context.AutoShowRoom;
        }
        
        protected static void xmlValidation(string fileName)
        {
            XmlReaderSettings readerSettings = new XmlReaderSettings();
            readerSettings.XmlResolver = new XmlUrlResolver();
            readerSettings.DtdProcessing = DtdProcessing.Parse;
            readerSettings.ValidationType = ValidationType.DTD;

            XmlReader xmlReader = XmlReader.Create(fileName, readerSettings);
            xmlReader.MoveToContent();

            XDocument doc = XDocument.Load(xmlReader);
        }

        protected void AddXmlToDataBaseButton_Click(object sender, EventArgs e)
        {
            foreach (string filename in Directory.GetFiles(Server.MapPath("~/XmlFiles"), "*.xml"))
            {
                string successStatus = "Успешно добавен в БД!";
                string failStatus = "Грешка!Неуспешна валидация спрямо DTD! Информация: ";
                string alreadyExistsStatus = "Грешка! Записът вече съществува в БД!";
                bool success = true;

                //Validate XML
                try
                {
                    xmlValidation(filename);
                }
                catch (System.Xml.Schema.XmlSchemaValidationException exc)
                {
                    success = false;
                    addStatusToTable(filename, failStatus + exc.Message, success);
                    continue;
                }

                //Loading file
                XmlDocument doc = new XmlDocument();

                XmlReaderSettings settings = new XmlReaderSettings();
                settings.XmlResolver = new XmlUrlResolver();
                settings.DtdProcessing = DtdProcessing.Parse;
                settings.ValidationType = ValidationType.DTD;                

                XmlReader reader = XmlReader.Create(filename, settings);
                reader.MoveToContent();
                doc.Load(reader);

                //Transform XML to Model:
                AutoShowRoom carShop = XmlToModel(doc);

                //Add to Database, if it's not already in DB:
                if (context.AutoShowRoom.Find(carShop.showroomID) == null)
                {
                    using (var newContext = new Model1())
                    {
                        newContext.AutoShowRoom.Add(carShop);
                        newContext.SaveChanges();
                    }
                    addStatusToTable(filename, successStatus, success);
                }
                else
                {
                    alert("Error! Already exists in Database!!!");
                    success = false;
                    addStatusToTable(filename, alreadyExistsStatus, success);
                }

            }

            AutoshowroomsGridView.DataBind();
        }

        protected void DeleteDbButton_Click(object sender, EventArgs e)
        {
            context.Car.RemoveRange(context.Car);
            context.Employee.RemoveRange(context.Employee);
            context.ClientAddress.RemoveRange(context.ClientAddress);
            context.ClientInfo.RemoveRange(context.ClientInfo);            
            context.Order.RemoveRange(context.Order);
            context.AutoShowRoom.RemoveRange(context.AutoShowRoom);

            context.SaveChanges();

            foreach (string filename in Directory.GetFiles(Server.MapPath("~/XmlFiles"), "*.xml"))
            {
                addStatusToTable(filename, "Успешно изтрит от БД!", true);
            }

            AutoshowroomsGridView.DataBind();
        }

        

    }
}