<%
/**
 * $RCSfile: sidebar.jsp,v $
 * $Revision: 1.5 $
 * $Date: 2003/01/23 06:48:50 $
 *
 * Copyright (C) 1999-2002 Jive Software. All rights reserved.
 *
 * This software is the proprietary information of Jive Software. Use is subject to license terms.
 */
%>

<%!
    private static final String INCOMPLETE = SetupActionSupport.INCOMPLETE;
    private static final String IN_PROGRESS = SetupActionSupport.IN_PROGRESS;
    private static final String DONE = SetupActionSupport.DONE;
%>

<%  // Get sidebar values from the session:

    String step1 = (String)session.getAttribute("jive.setup.sidebar.1");
    String step2 = (String)session.getAttribute("jive.setup.sidebar.2");
    String step3 = (String)session.getAttribute("jive.setup.sidebar.3");
    String step4 = (String)session.getAttribute("jive.setup.sidebar.4");
    String step5 = (String)session.getAttribute("jive.setup.sidebar.5");

    if (step1 == null) { step1 = IN_PROGRESS; }
    if (step2 == null) { step2 = INCOMPLETE; }
    if (step3 == null) { step3 = INCOMPLETE; }
    if (step4 == null) { step4 = INCOMPLETE; }
    if (step5 == null) { step5 = INCOMPLETE; }

    String[] items = {step1, step2, step3, step4, step5};
    String[] names = {
        "Install Checklist", "User System", "Datasource Settings", "Email Settings", "Admin Account"
    };
    String[] links = {
        "setup.index!default.jspa",
        "setup.usersystem!default.jspa",
        "setup.datasource!default.jspa",
        "setup.email!default.jspa",
        "setup.adminacct!default.jspa"
    };
%>

<%@ page import="com.jivesoftware.forum.Version,
                 com.jivesoftware.forum.action.setup.SetupActionSupport"%>

<%@ taglib uri="webwork" prefix="ww" %>

<table bgcolor="#cccccc" cellpadding="0" cellspacing="0" border="0" width="200">
<tr><td>
<table bgcolor="#cccccc" cellpadding="3" cellspacing="1" border="0" width="200">
<tr bgcolor="#eeeeee">
    <td align="center">
        <span style="padding:6px">
        <b>Setup Progress</b>
        </span>
    </td>
</tr>
<tr bgcolor="#ffffff">
    <td>
        <table cellpadding="5" cellspacing="0" border="0" width="100%">
        <%  for (int i=0; i<items.length; i++) { %>
            <tr>
            <%  if (INCOMPLETE.equals(items[i])) { %>

                <td width="1%"><img src="images/red.gif" width="20" height="20" border="0"></td>
                <td width="99%">
                        <%= names[i] %>
                </td>

            <%  } else if (IN_PROGRESS.equals(items[i])) { %>

                <td width="1%"><img src="images/yellow.gif" width="20" height="20" border="0"></td>
                <td width="99%">
                        <a href="<%= links[i] %>"><%= names[i] %></a>
                </td>

            <%  } else { %>

                <td width="1%"><img src="images/green.gif" width="20" height="20" border="0"></td>
                <td width="99%">
                        <a href="<%= links[i] %>"><%= names[i] %></a>
                </td>

            <%  } %>
            </tr>
        <%  } %>
        <tr><td colspan="2"><br><br><br><br></td></tr>
        </table>
    </td>
</tr>
</table>
</td></tr>
</table>