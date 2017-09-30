;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULELT1^INT^1^59547,73885^0
%QULELT1 ;
 
 
 
 
 
TRTACT(TP) N TY,OB,LISTE,ICI,Y1,R,FEN,BIDON,TEMP
 S MODG=0,OKU=1,OB=@TP@("O")
 S TY=$E(OB),OB=$E(OB,3,$L(OB))
 I TY'="t" Q
 D MEM^%QCAMEM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ACT") K @(TEMP)
 K (QUI,WHOIS,TY,OB,TEMP) D CURRENT^%IS,VARSYS^%QCSAP
 S FEN=TEMP
 S Y1=OB,R=2 D PFEN^%QS0DP,AFFICH^%QUAPAGM S LISTE=$$UN^%QUAPAGM S:LISTE'="" BIDON=$$ACTIVL^%TLIACTI(Y1,LISTE,0,0)
 D RMEM^%QCAMEM,REINIT^%EDPRLG Q
 Q
 Q
 
SGPKOUT(TP) 
 
 N Y1,I,RES,MENU1,IOFI,OKOPEN,AVECLEX,MENU,NFIC,COM,CONTR,OB,%O
 N EOBJ,ETTL,EMOD,EFOR,ERQS,EPSV,ENSCHX,EPRD
 N TY,OB,RAC,WECR
 S WECR=1
 S MODG=0,OKU=1,OB=@TP@("O"),RAC=OB
 S TY=$E(OB),OB=$E(OB,3,$L(OB))
 S EOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LFOR") K @(EOBJ)
 S ENSCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(ENSCHX)
 S ETTL=$$CONCAS^%QZCHAD(EOBJ,"TTL"),EMOD=$$CONCAS^%QZCHAD(EOBJ,"MOD")
 S EFOR=$$CONCAS^%QZCHAD(EOBJ,"FOR"),ERQS=$$CONCAS^%QZCHAD(EOBJ,"RQS")
 S EPSV=$$CONCAS^%QZCHAD(EOBJ,"PSV"),EPRD=$$CONCAS^%QZCHAD(EOBJ,"PRD")
AFF K @(EOBJ),@(ENSCHX)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SAUVEGARDE DE CONNAISSANCE"))
 S (@ENSCHX@("TRAITEMENTS"),@ENSCHX@("MODELES"),@ENSCHX@("FORMATS"),@ENSCHX@("REQUETES"),@ENSCHX@("PASSERELLES SUITE DE VALEURS"))=""
 K @(EOBJ)
 D TRT(RAC,.ETTL,.EMOD,.EFOR,.ERQS,.EPSV)
 D CLEPAG^%VVIDEO
 S NFIC=WHOIS_".ARC",CTR="" D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,40,6,7,"","",.CTR,.NFIC) Q:CTR'=""
 S COM="" D LIRE2^%VREAD("Commentaire    : ",COM,2,75,8,9,"","",.CTR,.COM)
 S MENU1(1)=$$^%QZCHW("OUI")_"^1",MENU1(2)=$$^%QZCHW("NON")_"^0"
 U 0 S DX=3,DY=12 X XY W $$^%QZCHW("Sauvegarde des mots du lexique associes ?")
 D ^%VQUIKMN(50,70,12,"MENU1",.AVECLEX,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECLEX'=0 AVECLEX=1
 D OPENFILE^%SYSUTI1(NFIC,"W",.IOFI,.OKOPEN)
 I '(OKOPEN) D ^%VZEAVT($$^%QZCHW("probleme sur l'ouverture du fichier")) Q
 D WRITE^%SYSUTI1(IOFI,$$^%QZCHW("sauvegarde de")_" "_WHOIS_" "_$$^%QZCHW("le")_" "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE_"(version 1.1)")
 D WRITE^%SYSUTI1(IOFI,COM)
 S OB="" F %O=1:1 S OB=$O(@ETTL@(OB)) Q:OB=""  D t^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EMOD@(OB)) Q:OB=""  D m^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EFOR@(OB)) Q:OB=""  D f^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@ERQS@(OB)) Q:OB=""  D r^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EPSV@(OB)) Q:OB=""  D psv^%SGPKOU3
 D:AVECLEX LEX^%SGPKOU2
 D WRITE^%SYSUTI1(IOFI,""),WRITE^%SYSUTI1(IOFI,"")
 D CLOSE^%SYSUTI1(IOFI,"W")
 Q
TRT(RAC,ETTL,EMOD,EFOR,ERQS,EPSV) 
 N TEMP,GRAP,X,Y,CPT,PILE,%I,REP,LIEN,TABRAC,TITRE
 S REP="TRAITEMENT",LIEN="APPELLE"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(TEMP)
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P")
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S CPT=0,@PILE@(CPT)=RAC,@GRAP@(RAC)="",%I=1
CHARGE 
 S CPT="" F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT) D VENTIL(X) S Y="" F %I=%I:1 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  D VENTIL(Y) S @GRAP@(X,Y)="" S:'($D(@GRAP@(Y))) @GRAP@(Y)="",@PILE@(%I)=Y
 Q
VENTIL(TP) 
 N TY,OB
 S MODG=0,OKU=1
 S OB=TP
 S TY=$E(OB),OB=$E(OB,3,$L(OB))
 I TY="t" S @ETTL@(OB)="" Q
 I TY="m" S @EMOD@(OB)="" Q
 I TY="f" S @EFOR@(OB)="" Q
 I TY="q" S @ERQS@(OB)="" Q
 I TY="p" S @EPSV@(OB)="" Q
 Q
 ;

