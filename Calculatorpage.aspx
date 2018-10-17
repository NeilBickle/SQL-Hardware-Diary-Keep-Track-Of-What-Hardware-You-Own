<%@ Page Language="C#"  %>
<%@import Namespace="System.Data.OleDb" %>
<script runat="server">
    void btnTotal_Click(Object s, EventArgs e)
    {
        String c = "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Server.MapPath("Numbers1.accdb") + ";";
        OleDbConnection a = new OleDbConnection(c);
        OleDbCommand cmd;
        OleDbDataReader g;
        String J;
        String b = "SELECT * From [Table1] WHERE [Identify]= " + txtNum.Value;
        cmd = new OleDbCommand(b, a);
        a.Open();
        g = cmd.ExecuteReader();
        J = "";
        while (g.Read())
        {

            if (g["Identify"].ToString() == txtNum.Value)
            {
                J = J + g["Hardware"];
            }

        }
        parResult.InnerHtml = J;
        a.Close();

    }

    void btnInsert_Click(Object s, EventArgs e)
    {
        String c = "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Server.MapPath("Numbers1.accdb") + ";";
        OleDbConnection a = new OleDbConnection(c);
        OleDbCommand cmd;
        OleDbDataReader g;
        String b = "INSERT INTO [Table1] ([Hardware]) VALUES ('" +txtIn.Value+ "');";
        cmd = new OleDbCommand(b, a);
        a.Open();
        g = cmd.ExecuteReader();
        while (g.Read())
        {

            txtIn.Value = g["Hardware"].ToString();

        }
        parResult.InnerHtml = "Your Record Has Been Added Successfully";
        a.Close();

    }

    void btnDelete_Click(Object s, EventArgs e)
    {
        String c = "Provider=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Server.MapPath("Numbers1.accdb") + ";";
        OleDbConnection a = new OleDbConnection(c);
        OleDbCommand cmd;
        OleDbDataReader g;
        String b = "DELETE FROM [Table1] WHERE [Identify]= " + txtNum.Value;
        cmd = new OleDbCommand(b, a);
        a.Open();
        g = cmd.ExecuteReader();
        while (g.Read())
        {

            txtNum.Value = g["Identify"].ToString();
        }
        parResult.InnerHtml = "Your Record Has Been Deleted Successfully.";
        a.Close();

    }
    </script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Hardware Logger And Searcher</h1>
        <input id="txtNum" runat="server" placeholder="ID Number one" /><br /><br /><br />
        <input id="txtIn" runat="server" placeholder="Insert In To Data" /><br /><br /><br />
        <input id="btnTotal" runat="server" value="Total" type="submit" onserverclick="btnTotal_Click" /><br /><br /><br />
        <input id="btnInsert" runat="server" value="Insert New Hardware In To The Database" type="submit" onserverclick="btnInsert_Click" />
        <input id="btnDelete" runat="server" value="Delete Hardware From The Database" type="submit" onserverclick="btnDelete_Click" />
        <p id="parResult" runat="server" ></p>
        <a href="GameShow.aspx">To The ID Number Page</a>
    </form>
</body>
</html>
