<%@ Page Title="genesis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="genesis.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<script language="C#" runat="server">
void genesis(Object s, EventArgs e)
{
	string myString = inputt.Text;
    string SayingBack = "";

string myConnectionString2 = "Provider=Microsoft.Jet.OLEDB.4.0;";
myConnectionString2 += @"Data Source=" + MapPath("sayings.mdb");
System.Data.OleDb.OleDbConnection my_cn2 = new System.Data.OleDb.OleDbConnection(myConnectionString2);
my_cn2.Open();
    
System.Data.DataSet myDs2 = new System.Data.DataSet();
System.Data.OleDb.OleDbDataAdapter myDa2 = new System.Data.OleDb.OleDbDataAdapter();
string sql2 = "SELECT * FROM sayings2";
myDa2 = new System.Data.OleDb.OleDbDataAdapter(sql2, myConnectionString2);
myDa2.Fill(myDs2, "Sayings");
System.Data.DataTable myTable2 = null;
myTable2 = myDs2.Tables["Sayings"];

string myConnectionString3 = "Provider=Microsoft.Jet.OLEDB.4.0;";
myConnectionString3 += @"Data Source=" + MapPath("typesofthings.mdb");
System.Data.OleDb.OleDbConnection my_cn3 = new System.Data.OleDb.OleDbConnection(myConnectionString3);
my_cn3.Open();
    
string sql3_Check = "SELECT * FROM tosay ORDER BY Rnd(-10000000*TimeValue(Now())*tosay.id)";
System.Data.DataSet myDs3_Check = new System.Data.DataSet();
System.Data.OleDb.OleDbDataAdapter myDa3_Check = new System.Data.OleDb.OleDbDataAdapter(sql3_Check, myConnectionString3);
myDa3_Check.Fill(myDs3_Check, "ToCheck");
System.Data.DataTable myTableCheck = null;
myTableCheck = myDs3_Check.Tables["ToCheck"];

string sql3General = "SELECT * FROM bodyparts ORDER BY Rnd(bodyparts.id)";
System.Data.OleDb.OleDbDataAdapter myDa3General = new System.Data.OleDb.OleDbDataAdapter(sql3General, myConnectionString3);
System.Data.DataSet myDs3General = new System.Data.DataSet();
myDa3General.Fill(myDs3General, "BodyParts");
System.Data.DataTable myTable3General = myDs3General.Tables["BodyParts"];
    
System.Data.DataSet myDsFind = new System.Data.DataSet();
                    string sql3Find = "SELECT TOP 8 * FROM tosay";
                    System.Data.OleDb.OleDbDataAdapter myDa3Find = new System.Data.OleDb.OleDbDataAdapter(sql3Find, myConnectionString3);
                    myDa3Find.Fill(myDsFind, "FindToSay");
                    System.Data.DataTable myTableFind = new System.Data.DataTable();
                    myTableFind = myDsFind.Tables["FindToSay"];
    
            String sqlToSay2 = "SELECT * FROM tosay ORDER BY Rnd(-10000000*TimeValue(Now())*tosay.id)";
            System.Data.OleDb.OleDbDataAdapter myDaToSay2 = new System.Data.OleDb.OleDbDataAdapter(sqlToSay2, myConnectionString3);
            System.Data.DataSet myDsToSay2 = new System.Data.DataSet();
            myDaToSay2.Fill(myDsToSay2, "OutputToSay");
            System.Data.DataTable myTableToSay2 = new System.Data.DataTable();
            myTableToSay2 = myDsToSay2.Tables["OutputToSay"];
    
string[] words;
char[] myChar = { '\'', '.', '?', '!', ',', ';', '\"' };  
string myString2 = myString.Trim(myChar);
myString2= myString2.ToLower();
words = (myString2).Split();

string sql3 = "SELECT TOP 1 * FROM bodyparts ORDER BY Rnd(-10000000*TimeValue(Now())*bodyparts.id)";
System.Data.OleDb.OleDbDataAdapter myDa3 = new System.Data.OleDb.OleDbDataAdapter(sql3, myConnectionString3);
System.Data.DataSet myDs3 = new System.Data.DataSet();
myDa3.Fill(myDs3, "BodyParts1");
System.Data.DataTable myTable3 = new System.Data.DataTable();
myTable3 = myDs3.Tables[0];

	int i = 0;
	for (i = 0; i <= words.Length - 1; i++)
	{
		if (words[i] == "your") {
			words[i] = "my";
		}
		else if (words[i] == "my")
		{
			words[i] = "your";
		}
		if (words[i] == "you")
		{
			words[i] = "me";
		}
		else if (words[i] == "me")
		{
			words[i] = "you";
		}
		if (words[i] == "yours")
		{
			words[i] = "mine";
		}
		else if (words[i] == "mine")
		{
			words[i] = "yours";
		}
		if (words[i] == "youre")
		{
			words[i] = "im";
		}
		else if (words[i] == "im")
		{
			words[i] = "youre";
		}
	}

		if (myString.Contains("!")) {
	SayingBack = SayingBack + "Oh, wow!" + Environment.NewLine;
		}
if (myString.Contains("?")) {
	SayingBack = SayingBack + "I will think about that." + Environment.NewLine;
		}
    
string sqlAllSay;
sqlAllSay = "SELECT * FROM tosay ORDER BY Rnd(-10000000*TimeValue(Now())*tosay.id)";
System.Data.OleDb.OleDbDataAdapter myDaAllSay = new System.Data.OleDb.OleDbDataAdapter(sqlAllSay, myConnectionString3);
System.Data.DataSet myDsAllSay = new System.Data.DataSet();
myDaAllSay.Fill(myDsAllSay, "OutputAllSay");
System.Data.DataTable myTableAllSay = myDsAllSay.Tables["OutputAllSay"];
i = 0;
bool maxit = false;
int count = 0;
int myColumn = 0;
for (i = 0; i <= words.Length - 1; i++) {
	foreach (System.Data.DataRow myRow in myTableAllSay.Rows) {
        for (myColumn = 0; myColumn <= words.Length - 1; myColumn++) {
			if (words[i] != "there" & words[i] != "this" & words[i] != "what" & words[i] != "like" & words[i] != "here" & words[i] != "is" & words[i] != "you" & words[i] != "i" & words[i] != "are" & words[i].Length > 3) {
                string rowness = myRow[myColumn].ToString();
                if (words[i] == rowness & maxit == false) {
                    SayingBack = SayingBack + myRow[1].ToString() + " " + myRow[2].ToString() + " " + myRow[3].ToString() + " " + myRow[4].ToString() + " " + myRow[5].ToString() + " " + myRow[6].ToString() + " " + myRow[7].ToString() + " " + myRow[8].ToString() + " " + myRow[9].ToString() + " " + myRow[10].ToString() + " " + myRow[11].ToString() + " " + myRow[12].ToString() + " " + myRow[13].ToString() + " " + myRow[14].ToString() + " " + myRow[15].ToString() + " " + myRow[16].ToString() + Environment.NewLine;
                Response.Write(SayingBack);
                    count += 1;
				if (count == 2) {
					maxit = true;
                }
				}
			}
		}
	}
}

if (SayingBack.Contains("an   ") && (!SayingBack.Contains("ean   "))) {
	SayingBack = SayingBack.Remove(SayingBack.IndexOf("n   ", 0), 3);
	foreach (System.Data.DataRow myRow3 in myTable3.Rows) {
		SayingBack = SayingBack + myRow3[7].ToString() + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
	}
} else if (SayingBack.Contains("by    ")) {
	foreach (System.Data.DataRow myRow3 in myTable3.Rows) {
		SayingBack = SayingBack.Remove(SayingBack.IndexOf("    ", 0), 3);
		SayingBack = SayingBack + " a " + myRow3[5].ToString() + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
	}
} else if (SayingBack.Contains("a    ")) {
	foreach (System.Data.DataRow myRow3 in myTable3.Rows) {
		SayingBack = SayingBack.Remove(SayingBack.IndexOf("    ", 0), 3);
		SayingBack = SayingBack + myRow3[7].ToString() + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
	}
}
     else if (SayingBack.Contains("because    ")) {
	foreach (System.Data.DataRow myRow3 in myTable3.Rows) {
		SayingBack = SayingBack.Remove(SayingBack.IndexOf("    ", 0), 7);
		SayingBack = SayingBack + "a " + myRow3[7].ToString() + " usually has " + myRow3[5] + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
    }
}
     else if (SayingBack.Contains("since    ")) {
	foreach (System.Data.DataRow myRow3 in myTable3.Rows) {
		SayingBack = SayingBack.Remove(SayingBack.IndexOf("    ", 0), 7);
		SayingBack = SayingBack + " my favorite color today is " + myRow3[3].ToString() + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
    }
}
else if (SayingBack.Contains("so    "))
{
    foreach (System.Data.DataRow myRow3 in myTable3.Rows)
    {
        SayingBack = SayingBack.Remove(SayingBack.IndexOf("    ", 0), 7);
        SayingBack = SayingBack + " I'm " + myRow3[4].ToString() + Environment.NewLine + Environment.NewLine;
        Response.Write(SayingBack);
    }
}


foreach (System.Data.DataRow myRowFind in myTableFind.Rows) {
	int r = 0;
	int q = 0;
	for (q = 1; q <= words.Length - 3; q++)
		for (r = 1; r <= 14; r++) {
			System.Data.OleDb.OleDbCommand SQLCmd = new System.Data.OleDb.OleDbCommand();
			SQLCmd.Connection = my_cn3;
			if (words[q] == myRowFind[r] && words[q + 1] == myRowFind[r + 1] && words[q - 1] == myRowFind[r - 1] && words[q + 2] == myRowFind[r + 2]) {
				string sqlEnter = null;
				foreach (System.Data.DataRow myRowTable in myTableToSay2.Rows) {
					int fork = 0;
					for (fork = 0; fork <= 14; fork++) {
                        if (words[q - 1] == myRowTable[fork] & words[q + 2] == myRowTable[fork + 3])
                        {
							string[] WordToSay = new string[16];
							int t = 0;
							for (t = 0; t <= 16; t++) {
								if (t < fork) {
									WordToSay[t] = myRowTable[t].ToString();
								} else if (t > fork + 3) {
									WordToSay[t] = myRowTable[t].ToString();
								} else if (t == fork) {
									WordToSay[t] = words[q - 1].ToString();
								} else if (t == fork + 1) {
									WordToSay[t] = words[q].ToString();
								} else if (t == fork + 2) {
									WordToSay[t] = words[q + 1].ToString();
								} else if (t == fork + 3) {
									WordToSay[t] = words[q + 2].ToString();
									sqlEnter = "INSERT INTO tosay (Word0, Word1, Word2, Word3, Word4, Word5, Word6, Word7, Word8, Word9, Word10, Word11, Word12, Word13, Word14, Word15, Word16) VALUES ('" + WordToSay[0] + "', '" + WordToSay[1] + "', '" + WordToSay[2] + "', '" + WordToSay[3] + "', '" + WordToSay[4] + "', '" + WordToSay[5] + "', '" + WordToSay[6] + "', '" + WordToSay[7] + "', '" + WordToSay[8] + "', '" + WordToSay[9] + "', '" + WordToSay[10] + "', '" + WordToSay[11] + "', '" + WordToSay[12] + "', '" + WordToSay[13] + "', '" + WordToSay[14] + "', '" + WordToSay[15] + "', '" + WordToSay[16] + "')";
									SQLCmd.CommandText = sqlEnter;
									SQLCmd.ExecuteNonQuery();
								}
							}
						}
					}
				}
			}
		}
	}

if (SayingBack.Length > 0) {
	Response.Write(SayingBack);
}
}
</script>
<asp:textbox id="inputt" runat="server" OnTextChanged="inputt_TextChanged"/>
<asp:button ID="Button1" type=submit text="Speak!" OnClick="genesis" runat="server"/>
<asp:label id = "saybacktext" runat="server"/>
</asp:Content>