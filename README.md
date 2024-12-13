# WhopTakeHome

## Features

- Infinite scrolling list with dynamic content loading
- VoiceOver accessibility support
- Unit tests for core functionality

## Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## Installation

1. Clone the repository:
```bash
git clone https://github.com/ste57/WhopTakeHome.git
```

2. Open `WhopTakeHome.xcodeproj` in Xcode

3. Build and run the project

### Key Components

- `ListItem`: Enum representing either a web link or folder
- `FolderStateCache`: Manages folder expansion states
- `ListItemGenerator`: Generates mock data for testing
- `WebViewContainer`: WKWebView wrapper for web content display

## Testing

The project includes unit tests for:
- Data model functionality
- State management
- Mock data generation
- Folder expansion logic

Run tests in Xcode using `⌘U` or through the test navigator.

## Future Improvements

- Persistent storage for folder states
- Improved error handling UI
- Advanced animations
- Search functionality
