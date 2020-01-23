const pythonShell = require('python-shell');

// option for python-shell
const pyOption = {
    mode: 'text',
    pythonPath: '/usr/local/bin/python',
    pythonOptions: ['-u'],
    scriptPath: '/src',
}

// Execute python-shell
const pyShell = new pythonShell.PythonShell('main.py', pyOption);

// Display stdout of python-shell
pyShell.on('message', (message) => {
    console.log(message);
});

// end of python-shell
pyShell.end(function (err, code, signal) {
    if (err) {
        console.error(err);
    }
    console.log('The exit code was: ' + code);
});
