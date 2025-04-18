const DEBUG_MODE = 0; // Set this to true to show UI in code editors

document.addEventListener('DOMContentLoaded', () => {
    const body = document.querySelector('body');
    
    if (!DEBUG_MODE) {
        body.style.display = 'none';
    }
});

// Listen for messages from the Lua side
window.addEventListener('message', (event) => {
    const data = event.data;
    
    if (data.type === "setVisible") {
        document.body.style.display = data.status ? 'flex' : 'none';
        if (data.status) {
            fetch(`https://${GetParentResourceName()}/requestFocus`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        } else {
            fetch(`https://${GetParentResourceName()}/releaseFocus`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({})
            });
        }
    }
});

// Close UI when Escape is pressed
document.addEventListener('keyup', (event) => {
    if (event.key === 'Escape') {
        document.body.style.display = 'none';
        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({})
        });
    }
});