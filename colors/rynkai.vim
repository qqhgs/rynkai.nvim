lua << EOF
package.loaded['rynkai'] = nil
package.loaded['rynkai.util'] = nil
package.loaded['rynkai.colors'] = nil
package.loaded['rynkai.theme'] = nil

require('rynkai.util').load()
EOF
