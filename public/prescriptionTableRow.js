(function() {
  var template = Handlebars.template, templates = Handlebars.templates = Handlebars.templates || {};
templates['prescriptionTableRow'] = template({"compiler":[8,">= 4.3.0"],"main":function(container,depth0,helpers,partials,data) {
    var helper, alias1=depth0 != null ? depth0 : (container.nullContext || {}), alias2=container.hooks.helperMissing, alias3="function", alias4=container.escapeExpression, lookupProperty = container.lookupProperty || function(parent, propertyName) {
        if (Object.prototype.hasOwnProperty.call(parent, propertyName)) {
          return parent[propertyName];
        }
        return undefined
    };

  return "<tr class=\"table-entry\">\n    <th>"
    + alias4(((helper = (helper = lookupProperty(helpers,"animalID") || (depth0 != null ? lookupProperty(depth0,"animalID") : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"animalID","hash":{},"data":data,"loc":{"start":{"line":2,"column":8},"end":{"line":2,"column":20}}}) : helper)))
    + "</th>\n    <th>"
    + alias4(((helper = (helper = lookupProperty(helpers,"animalName") || (depth0 != null ? lookupProperty(depth0,"animalName") : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"animalName","hash":{},"data":data,"loc":{"start":{"line":3,"column":8},"end":{"line":3,"column":22}}}) : helper)))
    + "</th>\n    <th>"
    + alias4(((helper = (helper = lookupProperty(helpers,"name") || (depth0 != null ? lookupProperty(depth0,"name") : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"name","hash":{},"data":data,"loc":{"start":{"line":4,"column":8},"end":{"line":4,"column":16}}}) : helper)))
    + "</th>\n    <th>"
    + alias4(((helper = (helper = lookupProperty(helpers,"frequency") || (depth0 != null ? lookupProperty(depth0,"frequency") : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"frequency","hash":{},"data":data,"loc":{"start":{"line":5,"column":8},"end":{"line":5,"column":21}}}) : helper)))
    + "</th>\n    <th class=\"hidden\"><a href="
    + alias4(((helper = (helper = lookupProperty(helpers,"pictureURL") || (depth0 != null ? lookupProperty(depth0,"pictureURL") : depth0)) != null ? helper : alias2),(typeof helper === alias3 ? helper.call(alias1,{"name":"pictureURL","hash":{},"data":data,"loc":{"start":{"line":6,"column":31},"end":{"line":6,"column":45}}}) : helper)))
    + "></a></th>\n</tr>";
},"useData":true});
})();