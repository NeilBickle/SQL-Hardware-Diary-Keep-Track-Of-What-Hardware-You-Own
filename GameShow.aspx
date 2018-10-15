<%@ Page Language="C#"  %>
<%@import Namespace="System.Data.OleDb" %>
<script runat="server">
void Page_Load()
    {
        String c = "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Server.MapPath("Numbers1.accdb") + ";";
        OleDbConnection a = new OleDbConnection(c);
        OleDbCommand cmd;
        OleDbDataReader g;
        String J;
        String b = "SELECT * FROM [Table1]";
        cmd = new OleDbCommand(b, a);
        a.Open();
        g = cmd.ExecuteReader();
        J = "";
        while (g.Read())
        {
            J = J + g["Identify"] + "&nbsp &nbsp &nbsp &nbsp &nbsp" + "<br/>";
            J = J + g["Hardware"] + "<br/>";
           

        }
        parResult.InnerHtml = J;
        a.Close();

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p id="parResult" runat="server"></p>
        <a href="Calculatorpage.aspx">Back</a>
    </form>
</body>
</html>
