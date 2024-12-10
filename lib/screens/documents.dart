import 'package:flutter/material.dart';

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  // Define folder open states for toggling
  bool isMyPropertiesOpen = false;
  bool isPublicDocumentsOpen = false;
  bool isVilla4321Open = false;
  bool isVilla8229Open = false;
  bool isPoliciesOpen = false;
  bool isHomesRegulationOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background
      body: SafeArea(
        child: Column(
          children: [
            // Custom Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),
                  const Spacer(),
                  const Text(
                    "My Documents",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Document Structure
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // My Documents Label
                        const Text(
                          "My Documents",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const Divider(color: Colors.grey, thickness: 1),

                        // My Properties Folder
                        _buildFolder(
                          "My Properties",
                          isMyPropertiesOpen,
                          onToggle: (expanded) {
                            setState(() {
                              isMyPropertiesOpen = expanded;
                            });
                          },
                          children: [
                            _buildFolder(
                              "Villa4321",
                              isVilla4321Open,
                              onToggle: (expanded) {
                                setState(() {
                                  isVilla4321Open = expanded;
                                });
                              },
                              children: [
                                _buildDocumentTile("PDF Document", "Subfolder for PDF"),
                              ],
                            ),
                            _buildFolder(
                              "Villa8229",
                              isVilla8229Open,
                              onToggle: (expanded) {
                                setState(() {
                                  isVilla8229Open = expanded;
                                });
                              },
                              children: [
                                _buildDocumentTile("Title Deed", "Tap to view"),
                                _buildDocumentTile("As Built Drawing", "Tap to view"),
                              ],
                            ),
                          ],
                        ),

                        // Public Documents Folder
                        _buildFolder(
                          "Public Documents",
                          isPublicDocumentsOpen,
                          onToggle: (expanded) {
                            setState(() {
                              isPublicDocumentsOpen = expanded;
                            });
                          },
                          children: [
                            _buildFolder(
                              "Policies and Procedures",
                              isPoliciesOpen,
                              onToggle: (expanded) {
                                setState(() {
                                  isPoliciesOpen = expanded;
                                });
                              },
                              children: [
                                _buildDocumentTile("Colour Gradient", "Tap to view"),
                              ],
                            ),
                            _buildFolder(
                              "Homes Regulation",
                              isHomesRegulationOpen,
                              onToggle: (expanded) {
                                setState(() {
                                  isHomesRegulationOpen = expanded;
                                });
                              },
                              children: [
                                _buildDocumentTile(
                                  "Real Estate Regulation Law",
                                  "Tap to view",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build folder widget
  Widget _buildFolder(String title, bool isOpen,
      {required Function(bool) onToggle, List<Widget> children = const []}) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(
        isOpen ? Icons.expand_less : Icons.expand_more,
        color: Colors.black,
      ),
      onExpansionChanged: onToggle,
      children: children,
    );
  }

  // Helper method to build document tile
  Widget _buildDocumentTile(String title, String subtitle) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: const Icon(Icons.picture_as_pdf, color: Colors.redAccent),
      onTap: () {
        // Add PDF opening logic here
      },
    );
  }
}
