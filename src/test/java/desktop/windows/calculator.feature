Feature: windows calculator

Scenario: Calc98
#* robot { window: 'Calculadora', fork: 'calc', highlight: true, highlightDuration: 500 }
* robot { window: 'Calc98 [Dec] [radians]',  highlight: true, highlightDuration: 500 }
* click('CE')
* click('1')
* click('+')
* click('2')
* click('=')
* print robot.clipboard
* screenshot()
* click('Cerrar')

