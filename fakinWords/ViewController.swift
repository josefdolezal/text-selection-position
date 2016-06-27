import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {
	@IBOutlet var textView: NSTextView!
	@IBOutlet var rangesView: NSTextView!

	override func viewDidLoad() {
		super.viewDidLoad()

		rangesView.continuousSpellCheckingEnabled = false
		rangesView.editable = false
		textView.delegate = self
		textView.continuousSpellCheckingEnabled = false
	}

	@IBAction func clearRanges(sender: NSButton) {
		rangesView.textStorage?.setAttributedString(NSAttributedString(string: ""))
	}

	func textViewDidChangeSelection(notification: NSNotification) {
		if textView.selectedRange().length != 0 {
			let length = textView.selectedRange().length
			let index  = textView.selectedRange().location

			rangesView.textStorage?.appendAttributedString(NSAttributedString(string: "ReadinHighlight(startIndex: \(index), length: \(length))\n"))
		}
	}
}

