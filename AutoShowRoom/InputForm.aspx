<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="InputForm.aspx.cs" Inherits="AutoShowRoom.InputForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Попълване на данни
    </h2>

    <div>
    </div>

        <asp:TextBox runat="server" ID="AutoShowRoomID_Input" />         
       
    <div>
        <asp:HyperLink ID="ToMainHyperLink" runat="server" NavigateUrl="~/MainPage.aspx">Back to main page</asp:HyperLink>
    </div>
    
        <asp:ListView ID="CarListView" runat="server" ItemType="AutoShowRoom.Car" DataKeyNames="CarID"
            SelectMethod="CarListView_GetData" InsertItemPosition="LastItem" InsertMethod="CarListView_InsertItem" DeleteMethod="CarListView_DeleteItem" OnSelectedIndexChanged="CarListView_SelectedIndexChanged">
            
            <LayoutTemplate>
                <table runat="server" id="CarsTable">
                    <colgroup>
                        <col  />
                        <col />
                    </colgroup>
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr runat="server">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="CarIDLabel" runat="server" AssociatedControlID="carID">ID на кола:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="CarID" Text='<%#: Item.carID %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="AddedByLabel" runat="server" AssociatedControlID="addedBy">добавено от(ID на служител):</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="AddedBy" Text='<%#: Item.addedBy %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="InStockLabel" runat="server" AssociatedControlID="InStock">В наличност ли е автомобила(t/f):</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="InStock" Text='<%#: Item.inStock %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="NewLabel" runat="server" AssociatedControlID="new">Нов ли е автомобила(t/f):</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="New" Text='<%#: Item._new %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="TotalOrdersLabel" runat="server" AssociatedControlID="totalOrders">Общ брой поръчки:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="TotalOrders" Text='<%#: Item.totalOrders %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="CountryOfOriginLabel" runat="server" AssociatedControlID="countryOfOrigin">Страна на произход:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="CountryOfOrigin" Text='<%#: Item.countryOfOrigin %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="BrandLabel" runat="server" AssociatedControlID="brand">Марка:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Brand" Text='<%#: Item.brand %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ModelLabel" runat="server" AssociatedControlID="model">Модел:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Model" Text='<%#: Item.model %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PowerLabel" runat="server" AssociatedControlID="power">Мощност:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Power" Text='<%#: Item.power %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="FuelLabel" runat="server" AssociatedControlID="fuel">Вид гориво:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Fuel" Text='<%#: Item.fuel %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="description">Описание:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Description" Text='<%#: Item.description %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClassLabel" runat="server" AssociatedControlID="class">Клас:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Class" Text='<%#: Item._class %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="price">Цена:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Price" Text='<%#: Item.price %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ColorLabel" runat="server" AssociatedControlID="color">Цвят:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Color" Text='<%#: Item.color %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="WeightLabel" runat="server" AssociatedControlID="weight">Тегло:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Weight" Text='<%#: Item.weight %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="SafetyRatingLabel" runat="server" AssociatedControlID="safetyRating">Рейтинг безопасност:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="SafetyRating" Text='<%#: Item.safetyRating %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="SeatsLabel" runat="server" AssociatedControlID="seats">Брой седалки:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Seats" Text='<%#: Item.seats %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Изтриване" />
                    </td>
                </tr>
            </ItemTemplate>

            <InsertItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="CarIDLabel" runat="server" AssociatedControlID="CarID">ID на кола: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="CarID" Text='<%#: BindItem.carID %>' />
                        <asp:RequiredFieldValidator ID="CarIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле CarID" ControlToValidate="carID" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="AddedByLabel" runat="server" AssociatedControlID="AddedBy">Добавена от(ID на служител): *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="AddedBy" Text='<%#: BindItem.addedBy %>' />
                        <asp:RequiredFieldValidator ID="AddedByRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Addedby" ControlToValidate="addedBy" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="InStockLabel" runat="server" AssociatedControlID="InStock">В наличност ли е(t/f): *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="InStock" Text='<%#: BindItem.inStock %>' />
                        <asp:RequiredFieldValidator ID="InStockRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле InStock" ControlToValidate="InStock" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="NewLabel" runat="server" AssociatedControlID="New">Нова ли е(t/f): *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="New" Text='<%#: BindItem._new %>' />
                        <asp:RequiredFieldValidator ID="NewRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле New" ControlToValidate="new" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="TotalOrdersLabel" runat="server" AssociatedControlID="TotalOrders">Брой поръчки: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TotalOrders" Text='<%#: BindItem.totalOrders %>' />
                        <asp:RequiredFieldValidator ID="TotalOrdersRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле TotalOrders" ControlToValidate="TotalOrders" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="CountryOfOriginLabel" runat="server" AssociatedControlID="CountryOfOrigin">Страна на произход: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="CountryOfOrigin" Text='<%#: BindItem.countryOfOrigin %>' />
                        <asp:RequiredFieldValidator ID="CountryOfOriginRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле CountryOfOrigin" ControlToValidate="CountryOfOrigin" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="brandLabel" runat="server" AssociatedControlID="Brand">Марка: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Brand" Text='<%#: BindItem.brand %>' />
                        <asp:RequiredFieldValidator ID="BrandRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Brand" ControlToValidate="brand" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                </tr>
                    <td>
                        <asp:Label ID="ModelLabel" runat="server" AssociatedControlID="Model">Модел: *</asp:Label>
                    </td>
                <td>
                    <asp:TextBox runat="server" ID="Model" Text='<%#: BindItem.model %>' />
                    <asp:RequiredFieldValidator ID="ModelRequiredFieldValidator" runat="server"
                        ErrorMessage="Задължително поле Model" ControlToValidate="Model" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PowerLabel" runat="server" AssociatedControlID="Power">Мошност: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Power" Text='<%#: BindItem.power %>' />
                        <asp:RequiredFieldValidator ID="PowerRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Power" ControlToValidate="Power" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="FuelLabel" runat="server" AssociatedControlID="Fuel">Вид гориво: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Fuel" Text='<%#: BindItem.fuel %>' />
                        <asp:RequiredFieldValidator ID="FuelRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Fuel" ControlToValidate="Fuel" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="DescriptionLabel" runat="server" AssociatedControlID="Description">Описание:</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Description" Text='<%#: BindItem.description %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClassLabel" runat="server" AssociatedControlID="Class">Клас: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Class" Text='<%#: BindItem._class %>' />
                        <asp:RequiredFieldValidator ID="ClassRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Class" ControlToValidate="Class" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" AssociatedControlID="Price">Цена: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Price" Text='<%#: BindItem.price %>' />
                        <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Price" ControlToValidate="Price" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ColorLabel" runat="server" AssociatedControlID="Color">Цвят: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Color" Text='<%#: BindItem.color %>' />
                        <asp:RequiredFieldValidator ID="ColorRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Color" ControlToValidate="Color" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="WeightLabel" runat="server" AssociatedControlID="Weight">Тегло: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Weight" Text='<%#: BindItem.weight %>' />
                        <asp:RequiredFieldValidator ID="WeightRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Weight" ControlToValidate="Weight" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="SafetyRatingLabel" runat="server" AssociatedControlID="SafetyRating">Рейтинг безопастност: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="SafetyRating" Text='<%#: BindItem.safetyRating %>' />
                        <asp:RequiredFieldValidator ID="SafetyRatingRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле SafetyRating" ControlToValidate="SafetyRating" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="SeatsLabel" runat="server" AssociatedControlID="Seats">Брой седалки: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Seats" Text='<%#: BindItem.seats %>' />
                        <asp:RequiredFieldValidator ID="SeatsRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Seats" ControlToValidate="Seats" ForeColor="Red" Display="Dynamic" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>
                
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Добавяне на автомобил" ValidationGroup="CarInsertValidationGroup" />
                        <asp:Button ID="CanceltButton" runat="server" CausesValidation="false" CommandName="Cancel" Text="Откажи" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="CarInsertValidationSummary" runat="server" ValidationGroup="CarInsertValidationGroup" />
                    </td>
                </tr>


                
                







            </InsertItemTemplate>

        </asp:ListView>        
        
        <asp:ListView ID="EmployeeListView" runat="server" ItemType="AutoShowRoom.Employee" DataKeyNames="EmployeeID"
            SelectMethod="EmployeeListView_GetData" InsertItemPosition="LastItem" InsertMethod="EmployeeListView_InsertItem" DeleteMethod="EmployeeListView_DeleteItem">

            <LayoutTemplate>
                <table runat="server" id="EmployeesTable">
                    <colgroup>
                        <col  />
                        <col />
                    </colgroup>
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr runat="server">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" AssociatedControlID="employeeID">ID на служител:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="EmployeeID" Text='<%#: Item.employeeID %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="NameLabel" runat="server" AssociatedControlID="Name">Име:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Name" Text='<%#: Item.name %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="SalaryLabel" runat="server" AssociatedControlID="Salary">Заплата:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Salary" Text='<%#: Item.salary %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PositionLabel" runat="server" AssociatedControlID="Position">Позиция:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="Position" Text='<%#: Item.position %>' />
                    </td>
                </tr>                
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="DeleteButton2" runat="server" CommandName="Delete" Text="Изтриване" />
                    </td>
                </tr>
            </ItemTemplate>
            <InsertItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="EmployeeIDLabel" runat="server" AssociatedControlID="EmployeeID">ID на служител: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="EmployeeID" Text='<%#: BindItem.employeeID %>' />
                        <asp:RequiredFieldValidator ID="EmployeeIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле EmployeeID" ControlToValidate="EmployeeID" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="NameLabel" runat="server" AssociatedControlID="Name">Име: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Name" Text='<%#: BindItem.name %>' />
                        <asp:RequiredFieldValidator ID="NameRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Name" ControlToValidate="name" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="SalaryLabel" runat="server" AssociatedControlID="Salary">Заплата: *</asp:Label>
                    </td>
                <td>
                    <asp:TextBox runat="server" ID="Salary" Text='<%#: BindItem.salary %>' />
                    <asp:RequiredFieldValidator ID="SalaryRequiredFieldValidator" runat="server"
                        ErrorMessage="Задължително поле Salary" ControlToValidate="Salary" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="PositionLabel" runat="server" AssociatedControlID="Position">Позиция: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Position" Text='<%#: BindItem.position %>' />
                        <asp:RequiredFieldValidator ID="PositionRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле Position" ControlToValidate="Position" ForeColor="Red" Display="Dynamic" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
                
                
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButton2" runat="server" CommandName="Insert" Text="Добавяне на служител" ValidationGroup="EmployeeInsertValidationGroup" />
                        <asp:Button ID="CanceltButton2" runat="server" CausesValidation="false" CommandName="Cancel" Text="Откажи" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="EmployeeInsertValidationSummary" runat="server" ValidationGroup="EmployeeInsertValidationGroup" />
                    </td>
                </tr>
            </InsertItemTemplate>

        </asp:ListView>        
        
        <asp:ListView ID="OrderView" runat="server" ItemType="AutoShowRoom.Order" DataKeyNames="OrderID"
            SelectMethod="OrderListView_GetData" InsertItemPosition="LastItem" InsertMethod="OrderListView_InsertItem" DeleteMethod="OrderListView_DeleteItem">

            <LayoutTemplate>
                <table runat="server" id="OrderTable">
                    <colgroup>
                        <col  />
                        <col />
                    </colgroup>
                    <tr runat="server" id="itemPlaceholder" />
                </table>
            </LayoutTemplate>

            <ItemSeparatorTemplate>
                <tr runat="server">
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
            </ItemSeparatorTemplate>

            <ItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderIDLabel" runat="server" AssociatedControlID="orderID">ID на поръчка:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="OrderID" Text='<%#: Item.orderID %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderedProductsLabel" runat="server" AssociatedControlID="OrderedProducts">ID на поръчана кола:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="OrderedProducts" Text='<%#: Item.orderedProducts %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProcessedByLabel" runat="server" AssociatedControlID="ProcessedBy">ID на служител, обработващ поръчката:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ProcessedBy" Text='<%#: Item.processedBy %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" AssociatedControlID="OrderDate">Дата на поръчка:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="OrderDate" Text='<%#: Item.date %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="TotalPriceLabel" runat="server" AssociatedControlID="TotalPrice">Стойност на поръчката:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="TotalPrice" Text='<%#: Item.price %>' />
                    </td>
                </tr> 
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientNameLabel" runat="server" AssociatedControlID="ClientName">Име на клиент:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ClientName" Text='<%#: Item.ClientInfo1.Name %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientCityLabel" runat="server" AssociatedControlID="ClientCity">Град/село:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ClientCity" Text='<%#: Item.ClientInfo1.Address %>' />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientTelephoneLabel" runat="server" AssociatedControlID="ClientTelephone">Телефон:</asp:Label>
                    </td>
                    <td>
                        <asp:Literal runat="server" ID="ClientTelephone" Text='<%#: Item.ClientInfo1.telephone %>' />
                    </td>
                </tr>                    
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="DeleteButton3" runat="server" CommandName="Delete" Text="Изтриване" />
                    </td>
                </tr>
            </ItemTemplate>
            <InsertItemTemplate>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderIDLabel" runat="server" AssociatedControlID="OrderID">ID на поръчка: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="OrderID" Text='<%#: BindItem.orderID %>' />
                        <asp:RequiredFieldValidator ID="OrderIDRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле OrderID" ControlToValidate="OrderID" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderedProductsLabel" runat="server" AssociatedControlID="OrderedProducts">ID на поръчан автомобил: *</asp:Label>
                    </td>
                <td>
                    <asp:TextBox runat="server" ID="OrderedProducts" Text='<%#: BindItem.orderedProducts %>' />
                    <asp:RequiredFieldValidator ID="OrderedProductsRequiredFieldValidator" runat="server"
                        ErrorMessage="Задължително поле OrderedProducts" ControlToValidate="OrderedProducts" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ProccessedByLabel" runat="server" AssociatedControlID="ProccessedBy">ID на служител, обработил поръчката: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ProccessedBy" Text='<%#: BindItem.processedBy %>' />
                        <asp:RequiredFieldValidator ID="ProccessedByRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ProccessedBy" ControlToValidate="ProccessedBy" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="OrderDateLabel" runat="server" AssociatedControlID="OrderDate">Дата на поръчката: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="OrderDate" Text='<%#: BindItem.date %>' />
                        <asp:RequiredFieldValidator ID="OrderDateRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле OrderDate" ControlToValidate="OrderDate" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="TotalPriceLabel" runat="server" AssociatedControlID="TotalPrice">Обща стойност: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TotalPrice" Text='<%#: BindItem.price %>' />
                        <asp:RequiredFieldValidator ID="TotalPriceRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле TotalPrice" ControlToValidate="TotalPrice" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientNameLabel" runat="server" AssociatedControlID="ClientName">Име на клиент: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ClientName" Text='<%#: BindItem.ClientInfo1.Name %>' />
                        <asp:RequiredFieldValidator ID="ClientRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ClientName" ControlToValidate="ClientName" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientCityLabel" runat="server" AssociatedControlID="ClientCity">Град/село: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ClientCity" Text='<%#: BindItem.ClientInfo1.Address %>' />
                        <asp:RequiredFieldValidator ID="ClientCityRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ClientCity" ControlToValidate="ClientCity" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                <tr runat="server">
                    <td>
                        <asp:Label ID="ClientTelephoneLabel" runat="server" AssociatedControlID="ClientTelephone">телефон: *</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="ClientTelephone" Text='<%#: BindItem.ClientInfo1.telephone %>' />
                        <asp:RequiredFieldValidator ID="ClientTelephoneRequiredFieldValidator" runat="server"
                            ErrorMessage="Задължително поле ClientTelephone" ControlToValidate="ClientTelephone" ForeColor="Red" Display="Dynamic" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
                
                
                <tr runat="server">
                    <td colspan="2">
                        <asp:Button ID="InsertButton3" runat="server" CommandName="Insert" Text="Добавяне на Поръчка" ValidationGroup="OrderInsertValidationGroup" />
                        <asp:Button ID="CanceltButton3" runat="server" CausesValidation="false" CommandName="Cancel" Text="Откажи" ValidationGroup="CancelValidationGroup" />

                        <asp:ValidationSummary ID="OrderInsertValidationSummary" runat="server" ValidationGroup="OrderInsertValidationGroup" />
                    </td>
                </tr>
            </InsertItemTemplate>

        </asp:ListView> 
           
        <asp:Button ID="SubmitButton" runat="server" Text="Запис на Автокъща" ValidationGroup="AutoShowRoomValidationGroup" OnClick="saveChanges_Click" />
        <asp:ValidationSummary ID="AutoShowRoomValidationSummary" runat="server" ValidationGroup="AutoShowRoomValidationGroup" />
    </form>
</body>
</html>
