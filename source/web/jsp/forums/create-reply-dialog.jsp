<%--
  Copyright (C) 2005 Alfresco, Inc.
 
  Licensed under the Mozilla Public License version 1.1 
  with a permitted attribution clause. You may obtain a
  copy of the License at
 
    http://www.alfresco.org/legal/license.txt
 
  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  either express or implied. See the License for the specific
  language governing permissions and limitations under the
  License.
--%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="/WEB-INF/alfresco.tld" prefix="a" %>
<%@ taglib uri="/WEB-INF/repo.tld" prefix="r" %>

<%@ page import="org.alfresco.web.bean.forums.ForumsBean.TopicBubbleViewRenderer" %>

<f:verbatim>
<script type="text/javascript">
   document.getElementById("dialog:dialog-body:message").focus();
   
   function checkButtonState()
   {
      if (document.getElementById("dialog:dialog-body:message").value.length == 0)
      {
         document.getElementById("dialog:finish-button").disabled = true;
      }
      else
      {
         document.getElementById("dialog:finish-button").disabled = false;
      }
   }
</script>
</f:verbatim>

<h:panelGrid cellpadding="2" cellspacing="2" border="0" width="100%"
             rowClasses="wizardSectionHeading, paddingRow">
   <h:outputText value="#{msg.message}" />
   <h:panelGrid cellpadding="2" cellspacing="2" border="0" columns="3" 
                columnClasses="alignTop, alignTop, alignTop">
      <h:graphicImage value="/images/icons/required_field.gif" alt="Required Field" />
      <h:outputText value="#{msg.message}:" />
      <h:inputTextarea id="message" value="#{DialogManager.bean.content}" rows="6" cols="70" 
                          onkeyup="checkButtonState();" onchange="checkButtonState();" />
   </h:panelGrid>
</h:panelGrid>

<f:verbatim>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr>
   <td width="100%">
      <% TopicBubbleViewRenderer.renderBubbleTop(out, request.getContextPath(), "yellow", "#FFF5A3"); %>
      </f:verbatim>
      <h:outputText value="#{msg.posted}:&nbsp" styleClass="mainSubTitle" escape="false" />
      <h:outputText value="#{BrowseBean.document.properties.created}">
         <a:convertXMLDate type="both" pattern="#{msg.date_time_pattern}" />
      </h:outputText>
      <f:verbatim>
      <% TopicBubbleViewRenderer.renderBubbleMiddle(out, request.getContextPath(), "yellow"); %>
      </f:verbatim>
      <h:outputText value="#{DialogManager.bean.replyContent}" escape="false" />
      <f:verbatim>
      <% TopicBubbleViewRenderer.renderBubbleBottom(out, request.getContextPath(), "yellow"); %>
   </td>
   <td valign="top">
      </f:verbatim>
      <h:graphicImage id="poster" url="/images/icons/user_large.gif" />
      <h:outputText value="<br/>#{BrowseBean.document.properties.creator}" escape="false" />
      <f:verbatim>
   </td>
   </tr>
</table>
</f:verbatim>


