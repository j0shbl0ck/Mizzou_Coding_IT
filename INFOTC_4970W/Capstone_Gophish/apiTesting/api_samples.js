function runCampaign() {
    createGroup();
    createCampaign();
} 
    var email = document.getElementById("emailaddress").value;
    var groupName = {}; // Globally scoped object

    async function createGroup() {
    // create random group name
    groupName.groupPhish = Math.random().toString(36).substring(7);
    const response = await fetch('https://45.56.126.232:3333/api/groups/?api_key=5caca5184bdafafa1d9fb4d1d89947d58f4d2f2ffa684e4645fd00a41a992630', {
        mode: 'no-cors',
        method: 'POST',
        headers: {
        'Content-Type': 'application/json'
        },

        body: JSON.stringify({
            // use random group name
            "name": groupName.groupPhish,
            "targets": [
            {
                // get email from input
                "email": email,
                "first_name": "Example",
                "last_name": "User",
                "position": ""
            },
            ]
        })
    });
    }
    
    createGroup();

    async function createCampaign() {
    var campaigngroup = (createGroup.groupName);
    const response = await fetch('https://45.56.126.232:3333/api/campaigns/?api_key=5caca5184bdafafa1d9fb4d1d89947d58f4d2f2ffa684e4645fd00a41a992630', {
        mode: 'no-cors',
        method: 'POST',
        headers: {
        'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            // generate random campaign name
            "name": Math.random().toString(36).substring(7),
            "template":{"name":"LoginGov"},
            "url":"http://45.56.126.232",
            "page":{"name":"landingPage"},
            "smtp":{"name":"sendingProfile"},
            "launch_date":null,
            "send_by_date":null,
            // uses random group name assigned from createGroup()
            "groups":[{"name":groupName.groupPhish}]
        })
    });
    }
    createCampaign();