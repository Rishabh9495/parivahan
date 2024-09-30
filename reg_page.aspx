<%@ Page Title="" Language="C#" MasterPageFile="~/OfficeInspection/SiteMaster.master"
    AutoEventWireup="true" CodeFile="reg_page.aspx.cs" Inherits="PMS_report11" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:content id="Content1" contentplaceholderid="HeadContent" runat="Server">
    <meta charset="utf-8" content="" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="Frontpage/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="Frontpage/assets/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <style>
        body
        {
            font-family: 'Poppins' , sans-serif;
        }
    </style>
      <script type="text/javascript" language="Javascript">

          function allowOnlyLetters(e, t) {
              if (window.event) {
                  var charCode = window.event.keyCode;
              }
              else if (e) {
                  var charCode = e.which;
              }
              else { return true; }
              if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                  return true;
              else {
                  alert("Please enter only alphabets");
                  return false;
              }
          }
          function isNumberKey(evt) {
              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                  return false;
              return true;
          }
          function validate(evt) {

              var charCode = (evt.which) ? evt.which : evt.keyCode;
              if (charCode > 31
                && (charCode < 48 || charCode > 57))
                  return false;
              return true;
          }
          function ValidateAlpha(evt) {
              var keyCode = (evt.which) ? evt.which : evt.keyCode
              if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && (keyCode != 32) && (keyCode != 32) && (keyCode != 44) && (keyCode < 46 || keyCode > 59))
                  return false;
              return true;
          }
          function upper(ustr) {
              var str = ustr.value;
              ustr.value = str.toUpperCase();
          }
          function ValidateChekckSums(FieldValue) {
              var number = FieldValue.value;
              if (number.length == 0) {
                  return;
              }

              if (number.length == 12) {
                  PageMethods.ValidateChekckSum(number, OnSuccess);
              }
              else {
                  alert("आधार संख्या गलत है, कृपया सही आधार संख्या दर्ज करें !");
                  return false;
              }
          }
          function ValidateIFSC(FieldValue) {
              var number = FieldValue.value;
              if (number.length == 0) {
                  return false;
              }
              if (number.length == 11) {
                  PageMethods.ValidateIFSC(number, OnSuccess);
              }
              else {
                  alert("IFSC CODE गलत है, कृपया सही IFSC CODE दर्ज करें ");
                  return false;
              }
          }
          function OnSuccess(response, userContext, methodName) {
              if (response == false) {
                  if (methodName == "ValidateIFSC") {
                      alert("IFSC CODE गलत है, कृपया सही IFSC CODE दर्ज करें ");
                      return false;
                  }
                  else {
                      alert("आधार संख्या गलत है, कृपया सही आधार संख्या दर्ज करें ");
                      return false;
                  }
                  return;
              }
          }
          function checkmobno(Mnumber) {
              var txt = Mnumber.value;
              var mobile_prefix = txt.substring(0, 2);
              var lnth = txt.length;
              if (lnth >= 2) {

                  if (mobile_prefix == 60 || mobile_prefix == 61 || mobile_prefix == 62 || mobile_prefix == 63 || mobile_prefix == 64 || mobile_prefix == 65 || mobile_prefix == 66 || mobile_prefix == 67 || mobile_prefix == 68 || mobile_prefix == 69 || mobile_prefix == 70
                    || mobile_prefix == 71 || mobile_prefix == 72 || mobile_prefix == 73 || mobile_prefix == 74 || mobile_prefix == 75 || mobile_prefix == 76 || mobile_prefix == 77 || mobile_prefix == 78 || mobile_prefix == 79
                    || mobile_prefix == 80 || mobile_prefix == 81 || mobile_prefix == 82 || mobile_prefix == 83 || mobile_prefix == 84 || mobile_prefix == 85 || mobile_prefix == 86 || mobile_prefix == 87 || mobile_prefix == 88 || mobile_prefix == 89
                    || mobile_prefix == 90 || mobile_prefix == 91 || mobile_prefix == 92 || mobile_prefix == 93 || mobile_prefix == 94 || mobile_prefix == 95 || mobile_prefix == 96 || mobile_prefix == 97 || mobile_prefix == 98 || mobile_prefix == 99) {
                  }
                  else {
                      alert('वैध मोबाइल नंबर दर्ज करें.');
                      Mnumber.value = '';
                  }
              }
          }
    </script>
</asp:content>
<asp:content id="Content2" contentplaceholderid="MainContent" runat="Server">

 <div class="container">
     <div class="panel panel-primary">
     
    <div class="container" style="background-color: white; color: Black; font-weight: bold; font-size: 12px; margin-left:0px; margin-right:0px; align-items:center">
        <br />
        <h3 style="text-align:center; color: blue;">
            <strong> कार्यालय निरीक्षण प्रतिवेदन </strong>
        </h3>
        <br />
        <div class="row" style="padding-bottom: 10px; font-size: 12px">
            <div class="col-md-3 text-left" style="padding-left:100px">
                <asp:Label ID="Label7" runat="server" Text="उप प्रभाग(Sub-Division):"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:DropDownList runat="server" Cssclass="form-control" ID="ddlsubdivision"></asp:DropDownList>
                </div>
            <div class="col-md-3 text-right" style="padding-left:100px">
                <asp:Label ID="Label8" runat="server" Text="खंड मैथा(Block):"></asp:Label>
            </div>
            <div class="col-md-3 text-right">
                <asp:DropDownList runat="server" Cssclass="form-control" ID="ddlblock"></asp:DropDownList>
                </div></div>
        <div class="row" style="padding-bottom: 10px; font-size: 12px">
           <%-- <div class="col-md-3 text-left" style="padding-left:100px">
                <asp:Label ID="Label9" runat="server" Text="छात्रावास का प्रकार:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
           <asp:DropDownList runat="server" Cssclass="form-control" ID="ddlHostelType"></asp:DropDownList>
            </div>--%>
             <div class="col-md-3 text-left" style="padding-left:100px">
                <asp:Label ID="Label10" runat="server" Text="जिला पिछड़ा अति पिछड़ा कल्याण पदाधिकारी का नाम "></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:TextBox ID="txtOfficerName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            </div>
         <div class="row" style="padding-bottom: 10px; font-size: 12px">
            <div class="col-md-3 text-left" style="padding-left:100px">
                <asp:Label ID="Label2" runat="server" Text="निरीक्षण की तिथि:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <div style="display:inline-block; width:200px">
                <asp:TextBox ID="txtIDate" runat="server" CssClass="form-control" ></asp:TextBox></div>
             <div style="display:inline-block"><rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtIDate"
                                        Format="dd-MM-yyyy" visible="True" ></rjs:PopCalendar></div>
            </div>
            <div class="col-md-3 text-right">
                <asp:Label ID="Label1" runat="server" Text="कार्यालय का नाम:"></asp:Label>
            </div>
            <div class="col-md-3 text-right">
                <asp:DropDownList CssClass="form-control" runat="server" ID="ddlofcname" AutoPostBack="True">
                </asp:DropDownList>
            </div>
        </div>

        <!------------------------------------------------------------ End 1-------------------------------------------------------------------->

          <div class="row" style="padding-bottom: 10px;font-size: 12px">
            <div class="col-md-3 text-left" style="padding-left:100px">
                <asp:Label ID="Label3" runat="server" Text="कार्यालय का स्थपाना वर्ष:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:TextBox ID="txtEyear" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3 text-right"style="padding-left:52px">
                <asp:Label ID="Label4" runat="server" Text="कार्यालय प्रधान का नाम:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:TextBox ID="txtHname"    runat="server" CssClass="form-control"></asp:TextBox>
            </div>
         </div>

       <!------------------------------------------------------------ End 2-------------------------------------------------------------------->

       <div class="row" style="padding-bottom: 10px;font-size: 12px">
            <div class="col-md-3 text-left"style="padding-left:100px">
                <asp:Label ID="Label5" runat="server" Text="कार्यालय प्रधान का मोबाइल नंबर:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:TextBox ID="txtHmobile" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3 text-right"style="padding-left:65px">
                <asp:Label ID="Label6" runat="server" Text="लंबित सेवांत का लाभ:"></asp:Label>
            </div>
            <div class="col-md-3 text-left">
                <asp:TextBox ID="txtPservice" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
         </div>

       <div class="row" style="padding-bottom: 30px; align-content:center">
              <div class="col-md-3" style="padding-left:100px">
               <asp:Label ID="Label38" runat="server" Text="स्थान:"></asp:Label>
               </div>
                <div class="col-md-3">
                <asp:TextBox ID="txtPlace" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                   <div class="col-md-3 text-right">
                   <asp:Label ID="Label39" runat="server" Text="दिनांक:"></asp:Label>
                   </div>
                     <div class="col-md-3">
                    <div class="row">
                    <div class="col-md-10">
                     <asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox>
               
                    </div>
                    <div class="col-md-2">
                          <rjs:PopCalendar ID="PopCalendar2" runat="server" Control="txtDate"
                                        Format="dd-MM-yyyy" visible="True" ></rjs:PopCalendar>
                    </div>
                    </div>
                   </div>
             
         </div>


          <div class="row" style="padding-bottom: 10px">
              <div class="col-md-12 text-center">
                  <asp:Button ID="btnSubmit" runat="server" Text="Submit" cssclass="btn btn-success" OnClick="btnSubmit_Click"/>
                  &nbsp; &nbsp;
                  <span>
                  <asp:Button ID="btnReset" runat="server" Text="Reset" cssclass="btn btn-success" OnClick="btnReset_Click"  />
                  &nbsp;</span> 
              </div>  
         </div>
                            <asp:Panel ID="pnlInspectionDetails" runat="server" Height="100%" ScrollBars="Both">
                                <asp:GridView ID="gvInspectionDetails" runat="server"  AutoGenerateColumns="False" EmptyDataText="Record Not Found...!"
                            OnRowCommand="gvInspectionDetails_RowCommand"          CssClass="CSSTableGeneratorGrid"    DataKeyNames="a_id"
                                   Style="width: 100%;" Visible="true" > 
                                     <Columns>
                                                  <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton Style="color: Blue" CommandArgument='<%#Eval("a_id")%>' CommandName="application"
                                    runat="server" ID="lnkselect">Select</asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" BackColor="#0b6da7" ForeColor="White" Font-Bold="true" />
                            <ItemStyle HorizontalAlign="left" />
                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" BackColor="#0b6da7" ForeColor="White"
                                Font-Size="Small" />
                        </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Sl.No." ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" HeaderStyle-CssClass="columnPadding">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="OfficeInspectionDate" HeaderText=" Inspection Date" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding" DataFormatString = "{0:dd-MM-yyyy}"></asp:BoundField>
                                         <asp:BoundField DataField="Block" HeaderText="Block" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                         <asp:BoundField DataField="OfficeName" HeaderText="Office Name" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                        <asp:BoundField DataField="OfficeEstablishmentYear" HeaderText="Establishment Year" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                        <asp:BoundField DataField="OfficeHeadName" HeaderText="Office Head Name" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                        <asp:BoundField DataField="OfficeHeadMobile" HeaderText=" Office Head Mobile No." HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding" ></asp:BoundField>
                                        <asp:BoundField DataField="PendingSevantLabh" HeaderText="Pending Sevant Labh" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                      
                                        <asp:BoundField DataField="InspectionTeamPlace" HeaderText="Inspection Place" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding"></asp:BoundField>
                                        <asp:BoundField DataField="InspectionDate" HeaderText="Inspection Date" HeaderStyle-ForeColor="White"
                                            HeaderStyle-BackColor="#14427d" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="columnPadding"
                                            ItemStyle-CssClass="columnPadding" DataFormatString = "{0:dd-MM-yyyy}"></asp:BoundField>
                                        
                                     </Columns>

                                </asp:GridView>
                                </asp:Panel>
                    </div>
                </div>
          </div>               
</asp:content>
