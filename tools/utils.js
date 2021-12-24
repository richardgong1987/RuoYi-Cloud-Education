const fs = require('fs-extra')
const menuTomlPath = "./menu/menu.toml";

async function exportFile(f, text) {
    await fs.outputFile(f, text);
}

async function outMenuToml(text) {
    await exportFile(menuTomlPath, text)
}

async function outSql(text) {
    await exportFile("../sql-eduction/menu.sql", text)
}

async function reorderMenuIds() {
    const html = require('fs').readFileSync(menuTomlPath, 'utf8');
    let id = 3000;
    const toml = html.replace(/menuId = (\d+)/g, (a, match) => `menuId = ${id++}`);
    await outMenuToml(toml);
}

exports.reorderMenuIds = reorderMenuIds;
exports.exportFile = exportFile;
exports.outSql = outSql;
exports.outMenuToml = outMenuToml;