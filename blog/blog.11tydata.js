const {titleCase} = require("title-case");

module.exports = {
    layout: "default.html",
    type: "blogpost",
    eleventyComputed: {
        title: function(data) {
            const itm = this.getCollectionItem(data.collections.blogpost, {...data.page});
            const content = itm?.template.frontMatter.content;

            function getTitle(content) {
                if(!content) return null;
                const firstLine = content.substring(0, content.indexOf('\n'));
                return firstLine.startsWith("#") ? firstLine.replace(/#\s*/, '').replace(/\r/, '') : null;
            }

            return getTitle(content) || titleCase(data.title || data.page.fileSlug)
        }
    }
}
