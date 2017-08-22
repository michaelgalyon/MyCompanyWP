declare interface IMyCompanyWpStrings {
  PropertyPaneDescription: string;
  NewsGroupName: string;
  NewsLibraryFieldLabel: string;
  NewsSiteUrlFieldLabel: string;
  AnnoucementsGroupName: string;  
  AnnouncementsListFieldLabel: string;
  AnnouncementsSiteUrlFieldLabel: string;
  LinksGroupName: string;
  WeatherDefaultLocation: string;
  ComplianceLinkFieldLabel: string;
  CafeMenuLinkFieldLabel: string;
}

declare module 'myCompanyWpStrings' {
  const strings: IMyCompanyWpStrings;
  export = strings;
}
