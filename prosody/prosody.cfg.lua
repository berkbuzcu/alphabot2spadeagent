-- spade.cfg.lua
-- A sample Prosody configuration file for SPADE agents

-- Global settings
admins = { "admin@localhost" }  -- Replace with your admin JID if needed
daemonize = false

log = {
    info = "console";
    error = "console";
    debug = "console";
}

pidfile = "/var/run/prosody.pid"

-- Enable required modules
modules_enabled = {
    "roster";         -- Allows users to have a roster
    "saslauth";       -- Handles authentication for clients and servers
    "tls";            -- Enables TLS encryption
    "dialback";       -- Supports server-to-server dialback
    "disco";          -- Service discovery
}

-- Disable registration if you want to use pre-created accounts for your SPADE agents
allow_registration = false

-- Virtual host configuration for your domain (adjust "localhost" to your domain)
VirtualHost "localhost"
    authentication = "internal_plain"  -- Use "internal_hashed" if you prefer hashed passwords
    ssl = {
        key = "/etc/prosody/certs/localhost.key";         -- Path to your SSL key
        certificate = "/etc/prosody/certs/localhost.crt";   -- Path to your SSL certificate
    }

-- Optional: Configure a multi-user chat component if needed
Component "conference.localhost" "muc"
    storage = "memory"
    muc_room_locking = false
    muc_room_default_public_jids = true

-- Optional: Uncomment to allow server-to-server communication
-- s2s_default_policy = "allow"
