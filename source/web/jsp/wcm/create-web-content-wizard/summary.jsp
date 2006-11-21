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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/alfresco.tld" prefix="a" %>
<%@ taglib uri="/WEB-INF/repo.tld" prefix="r" %>
<%@ page isELIgnored="false" %>
<script type="text/javascript">
  window.onload = function() { document.getElementById("wizard:finish-button").focus(); }
</script>

<h:selectBooleanCheckbox id="startWorkflow"
			 value="#{WizardManager.bean.startWorkflow}"/>
<h:outputText value="&nbsp;#{msg.create_web_content_summary_submit_message}" escape="false" />

<h:panelGrid columns="1" cellpadding="2" style="padding-top: 4px; padding-bottom: 4px;"
             width="100%" rowClasses="wizardSectionHeading">
  <h:outputText value="&nbsp;#{msg.create_web_content_summary_content_details}" escape="false" />
</h:panelGrid>

<h:panelGrid columns="2" cellpadding="3" cellspacing="3" border="0">
  <h:outputText value="#{msg.name}:"/>
  <h:outputText value="#{WizardManager.bean.formInstanceData.name}"/>
  <h:outputText value="#{msg.location}:"/>
  <h:outputText value="#{WizardManager.bean.formInstanceData.webappRelativePath}"/>
  <h:outputText value="#{msg.form}:"/>
  <h:outputText value="#{WizardManager.bean.formInstanceData.form.name}"/>
</h:panelGrid>

<h:panelGrid columns="1" cellpadding="2" style="padding-top: 4px; padding-bottom: 4px;"
             width="100%" rowClasses="wizardSectionHeading">
  <h:outputText value="&nbsp;#{msg.create_web_content_summary_rendition_details}" escape="false" />
</h:panelGrid>

<h:panelGrid columns="2" cellpadding="3" cellspacing="3" border="0">
  <c:forEach items="${WizardManager.bean.renditions}" var="rendition">
    <h:outputText value="#{msg.name}:"/>
    <a:actionLink value="${rendition.name}" 
		  image="/images/icons/preview_website.gif" 
		  showLink="true" 
		  href="${rendition.url}" 
		  target="new">${rendition.name}</a:actionLink>
    <h:outputText value="#{msg.location}:"/>
    <f:verbatim>${rendition.webappRelativePath}</f:verbatim>
  </c:forEach>
</h:panelGrid>


