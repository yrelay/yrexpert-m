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

;%TXPSUT2^INT^1^59547,74033^0
%TXPSUT2 ;;07:40 PM  4 Jun 1993; 24 Jun 92  4:23 PM ; 04 Jun 93  7:40 PM
 
 
 
SAISVAL(GSUIV,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,NBCSCR) 
 N GLO,VALCON,AROBA,TAIPAGE,PAGE
 N TEMP,MENG,PAGECOUR,NBPAGE,I,J,K
 N VAR,STO,LIB,VAL,VALSCR,LIBSCR,STOSCR,STOCON
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"E"),MENG=$$CONCAS^%QZCHAD(TEMP,"MG")
 S STO="STOCON",VAL="VALCON"
 S GLO=$$TEMP^%SGUTIL
 
 S IDBPAGE=0,PAGECOUR=1,TAIPAGE=NBC-(NBFIXB+NBFIXH)
 S NBPAGE=(NBCSCR\TAIPAGE)+$S((NBCSCR#TAIPAGE)=0:0,1:1)
 
 S @MENG="17^15^60"
 S @MENG@(1)=$$^%QZCHW("+")_"^PLUS",@MENG@(1,"COM")=$$^%QZCHW("page suivante"),@MENG@(2)=$$^%QZCHW("-")_"^MOINS",@MENG@(2,"COM")=$$^%QZCHW("page precedente")
 S @MENG@(3)=$$^%QZCHW("modifier")_"^MODIF",@MENG@(3,"COM")=$$^%QZCHW("modifier les valeurs de cette page"),@MENG@(4)=$$^%QZCHW("FIN")_"^FIN",@MENG@(4,"COM")=$$^%QZCHW("fin")
 
 
 F I=1:1:NBFIXH S VAR(I)=@GLODEFA@("FIXH",I,"LIB"),@("V2="_@GLODEFA@("FIXH",I,"ROUCAL")) S:'($D(@GSUIV@(VAR(I)))) @GSUIV@(VAR(I))=V2 S STO(I)=VAR(I),VAL(I)=@GSUIV@(VAR(I)),LIB(I)=STO(I)
 S K=1
 F I=(NBC-NBFIXB)+1:1:NBC S VAR(I)=@GLODEFA@("FIXB",K,"LIB"),@("V2="_@GLODEFA@("FIXB",K,"ROUCAL")),K=K+1 S:'($D(@GSUIV@(VAR(I)))) @GSUIV@(VAR(I))=V2 S STO(I)=VAR(I),VAL(I)=@GSUIV@(VAR(I)),LIB(I)=STO(I)
 F I=1:1:NBCSCR D CHPSCR
 G AFF
CHPSCR S @("V1="_@GLODEFA@("ROULIB")_"("_I_")")
 S VAR(I)=V1 I '($D(@GSUIV@(VAR(I)))) S @("V2="_@GLODEFA@("ROUDEF")_"("_I_")"),@GSUIV@(VAR(I))=V2
 S @("LIBSCR(I)="_@GLODEFA@("ROUAFF")_"("_I_")")
 S STOSCR(I)=VAR(I)
 S VALSCR(I)=@GSUIV@(VAR(I))
 Q
 
 
AFF D CLFEN^%VVIDEO(1,4,15,78)
 S TAIPCOUR=$S((IDBPAGE+TAIPAGE)<NBCSCR:TAIPAGE,1:NBCSCR-IDBPAGE)
 S J=1 F I=IDBPAGE+1:1 Q:J>TAIPCOUR  S LIB(NBFIXH+J)=LIBSCR(I),VAL(NBFIXH+J)=VALSCR(I),STO(NBFIXH+J)=STOSCR(I),J=J+1
 F I=(TAIPCOUR+NBFIXH)+1:1:NBC-NBFIXB S LIB(I)=" ",VAL(I)=" "
 S ABAND="N"
 K @(GLO)
 
 S @GLO=TITRE_" ("_PAGECOUR_"/"_NBPAGE_")"
 S @GLO@("FL")="WLDR",@GLO@("H")=10,@GLO@("V")=6,@GLO@("NBC")=NBC
 
 S (%pll,%PLL)=0 F J=1:1:NBC S @GLO@("CHAMPS",J)=LIB(J),%pll=$L(LIB(J)) I %pll>%PLL S %PLL=%pll
 
 S @GLO@("PLL")=%PLL
 
 S @GLO@("L")=20 F I=1:1:NBC S @GLO@("LARG",I)=20
 
 
 S K=1 F I=NBFIXH+1:1 Q:K=TAIPCOUR  S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I,K=K+1
 S @GLO@("SUIV",I)=1+NBFIXH,@GLO@("PREC",1+NBFIXH)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 F I=1:1:NBC S @GLO@("AIDE",I)="Non defini"
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1,@GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=TJSOK
 S @GLO@("UCONT")=TJSOK
 
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK,@GLO@("FORMAT",I)=TJSOK,@GLO@("VALEG",I,0)=TJSOK
 
 S VALCON="STOCON",STOCON="AROBA"
 F I=1:1:NBC S STOCON(I)=VAL(I)
 G:NBPAGE=1 MODIF
 D AFF^%PKSAISI(0,0,1,0,0,GLO,VALCON,.ERR)
 
 
MEN D ^%VQUIKMN(10,60,18,MENG,.ADRES,.CONTR) G:(CONTR="A")!(CONTR="F") FIN G:ADRES'="" @ADRES G MEN
 
FIN D CLFEN^%VVIDEO(1,4,15,78)
 K @(GLO),@(TEMP)
 Q
 
PLUS I (IDBPAGE+TAIPAGE)'<NBCSCR D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE+TAIPAGE,PAGECOUR=PAGECOUR+1
 G AFF
 
MOINS I IDBPAGE=0 D ^%VSQUEAK G MEN
 S IDBPAGE=IDBPAGE-TAIPAGE,PAGECOUR=PAGECOUR-1
 G AFF
 
MODIF S @GLO@("FL")="LDR"
 D ^%PKSAISI(0,0,1,0,0,GLO,VALCON,.ERR)
 
 I '($D(AROBA)) S ABAND="O" G:NBPAGE=1 FIN G MEN
 
 F I=1:1:NBC I LIB(I)'=" " S @GSUIV@(STO(I))=$P(AROBA,$C(0),I)
 F I=1:1:NBCSCR S VALSCR(I)=@GSUIV@(STOSCR(I))
 G:NBPAGE=1 FIN
 G MEN
 ;

