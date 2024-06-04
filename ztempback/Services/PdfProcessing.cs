using System.IO;
using System.Linq;
using System.Web;
using System.Windows;
using System.Windows.Media;
using Telerik.Web.UI;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.FormatProviders.Text;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.ColorSpaces;
using Telerik.Windows.Documents.Fixed.Model.Editing;

namespace RedbonePlatform.Services
{
	public class PdfProcessing
	{
		public static RadFixedDocument StampWithImage(RadFixedDocument PdfDocument, byte[] Stamp, string StampImageType, PdfStampPosition Position, double Top = 0, double Left = 0)
		{
			var pdfFile = new MemoryStream(new PdfFormatProvider().Export(PdfDocument));
			return StampWithImage(pdfFile, Stamp, StampImageType, Position, Top, Left);
		}

		public static RadFixedDocument StampWithImage(UploadedFile PostedFile, byte[] Stamp, string StampImageType, PdfStampPosition Position, double Top = 0, double Left = 0)
		{
			return StampWithImage(PostedFile.InputStream, Stamp, StampImageType, Position, Top, Left);
		}

		public static RadFixedDocument StampWithImage(HttpPostedFile PostedFile, byte[] Stamp, string StampImageType, PdfStampPosition Position, double Top = 0, double Left = 0)
		{
			return StampWithImage(PostedFile.InputStream, Stamp, StampImageType, Position, Top, Left);
		}

		public static RadFixedDocument StampWithImage(Stream PdfFile, byte[] Stamp, string StampImageType, PdfStampPosition Position, double Top = 0, double Left = 0)
		{
			double x = 0;
			double y = 0;
			PdfFormatProvider provider = new PdfFormatProvider();
			RadFixedDocument fixedDocument = provider.Import(PdfFile);
			RadFixedPage page = fixedDocument.Pages.First();
			FixedContentEditor editor = new FixedContentEditor(page);

			//var stampSourcePath = StampPath;

			//load the stamp image
			Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource imageSource;

			//using (FileStream source = File.Open(stampSourcePath, FileMode.Open))
			//{
			//	imageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(source);
			//}

			using (MemoryStream ms = new MemoryStream(Stamp))
			{
				imageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(ms);
			}

			switch (Position)
			{
				case PdfStampPosition.Center:
					x = (page.Size.Width - imageSource.Width) / 2;
					y = (page.Size.Height - imageSource.Height) / 2;
					break;
				case PdfStampPosition.TopLeft:
					x = 0;
					y = 0;
					break;
				case PdfStampPosition.TopRight:
					x = page.Size.Width - imageSource.Width;
					y = 0;
					break;
				case PdfStampPosition.BottomLeft:
					x = 0;
					y = page.Size.Height - imageSource.Height;
					break;
				case PdfStampPosition.BottomRight:
					x = page.Size.Width - imageSource.Width;
					y = page.Size.Height - imageSource.Height;
					break;
				case PdfStampPosition.Custom:
					x = Left;
					y = Top >= 0 ? Left : page.Size.Height - imageSource.Height + Top;
					break;
			}

			editor.Position.Translate(x, y);
			editor.DrawImage(imageSource);

			return fixedDocument;
		}

		//Not tested yet!
		public static RadFixedDocument StampWithText(Stream PdfFile, string StampText, PdfStampPosition Position, string
			FontName = "Arial", double FontSize = 12, byte Transparency = 100, double Top = 0, double Left = 0)
		{
			double x = 0;
			double y = 0;
			PdfFormatProvider provider = new PdfFormatProvider();
			RadFixedDocument fixedDocument = provider.Import(PdfFile);
			RadFixedPage page = fixedDocument.Pages.First();
			FixedContentEditor editor = new FixedContentEditor(page);

			Block block = new Block();
			block.TextProperties.FontSize = FontSize;
			block.TextProperties.TrySetFont(new FontFamily(FontName), FontStyles.Normal, FontWeights.Bold);
			block.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
			block.VerticalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment.Center;
			block.GraphicProperties.FillColor = new RgbColor(Transparency, 0, 0, 0);
			block.InsertText(StampText);

			switch (Position)
			{
				case PdfStampPosition.Center:
					x = (page.Size.Width - block.ActualSize.Width) / 2;
					y = (page.Size.Height - block.ActualSize.Height) / 2;
					break;
				case PdfStampPosition.TopLeft:
					x = 0;
					y = 0;
					break;
				case PdfStampPosition.TopRight:
					x = page.Size.Width - block.ActualSize.Width;
					y = 0;
					break;
				case PdfStampPosition.BottomLeft:
					x = 0;
					y = page.Size.Height - block.ActualSize.Height;
					break;
				case PdfStampPosition.BottomRight:
					x = page.Size.Width - block.ActualSize.Width;
					y = page.Size.Height - block.ActualSize.Height;
					break;
				case PdfStampPosition.Custom:
					x = Left;
					y = Top >= 0 ? Left : page.Size.Height - block.ActualSize.Height + Top;
					break;
			}

			editor.Position.Translate(x, y);
			editor.DrawBlock(block);

			return fixedDocument;
		}

		public static RadFixedDocument ImportPdfDocument(Stream sourceFile)
		{
			RadFixedDocument document = new RadFixedDocument();
			PdfFormatProvider provider = new PdfFormatProvider();

			document = provider.Import(sourceFile);

			return document;
		}

		public static string PdfToText(RadFixedDocument document)
		{
			TextFormatProvider provider = new TextFormatProvider();
			string documentContent = provider.Export(document);

			return documentContent;
		}

		public static RadFixedDocument CreatePdfDocument(Stream sourceFile)
		{
			PdfFormatProvider provider = new PdfFormatProvider();
			RadFixedDocument document = provider.Import(sourceFile);

			return document;
		}

		public static RadFixedDocument JoinFiles(Stream File1, Stream File2)
		{
			PdfFormatProvider provider = new PdfFormatProvider();
			RadFixedDocument document1 = provider.Import(File1);
			RadFixedDocument document2 = provider.Import(File2);

			document1.Merge(document2);

			return document1;
		}

		public enum PdfStampPosition
		{
			Center,
			TopLeft,
			TopRight,
			BottomLeft,
			BottomRight,
			Custom
		}

	}
}