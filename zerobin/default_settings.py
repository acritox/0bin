# Get error messages and auto reload.
# Don't set this to True in production
DEBUG = False

# Port and host for the embedded python server
HOST = "127.0.0.1"
PORT = "3255"

# Names/links to insert in the footer.
#
MENU = (
    ("GitHub", "https://github.com/acritox/0bin"),
    ("FAQ", "/faq/"),
    ("Contact", "mailto:mail@aloibl.de"),
)

# Size limit of the paste content in bytes. Be careful, allowing a size too big can
# slow down the user's browser
MAX_SIZE = 1024 * 1000

# Display a tiny counter for pastes created.
DISPLAY_COUNTER = False
# Refresh counter interval.
REFRESH_COUNTER = 60  # in seconds

# Length of the paste-id string in the url, int from 4 to 27 (length of sha1 digest)
# total number of unique pastes can be calculated as 2^(6*PASTE_ID_LENGTH)
# for PASTE_ID_LENGTH=8, for example, it's 2^(6*8) = 281 474 976 710 656
PASTE_ID_LENGTH = 8
