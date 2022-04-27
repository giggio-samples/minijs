import Koa from 'koa';
const app = new Koa();

app.use(async ctx => {
    ctx.body = 'Hello World';
});
// app.listen(3000);
var server = app.listen(3000, () => {
    console.log('Server is running at port 3000');
});


function cleanup() {
    console.log('Closing connections...');
    server.on('close', () => {
        console.log('Closed.');
        process.exit(0);
    })
    server.close();
    setTimeout(() => {
        console.log('Force closing, connections did not stop on time.');
        process.exit(0);
    }, 5000);
}

process.on('SIGINT', cleanup);
process.on('SIGTERM', cleanup);