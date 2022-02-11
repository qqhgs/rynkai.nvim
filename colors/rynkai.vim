lua << EOF
package.loaded['rynkai'] = nil
package.loaded['rynkai.colors'] = nil
package.loaded['rynkai.theme'] = nil
package.loaded['rynkai.hsluv'] = nil
package.loaded['rynkai.fn'] = nil
package.loaded['rynkai.util'] = nil

require('rynkai.util').load()
EOF
