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

;%QMEXO1^INT^1^59547,73878^0
%QMEXO1 ;;04:25 PM  19 Nov 1993; ; 19 Nov 93  4:25 PM
 
 
 
EDITE(ATN) 
 N REPE,REP,LIEN,RAC,TEMP,GRAP,GRAC,UCONT,TITRE
 N NUMZOOM,NUMUNZOO,ATNASSO
 N GLOET,CARETU,PERE,REPATN
 N IET,I,%IET,PILE,IDFC
 S PILE=$$TEMP^%SGUTIL
 S @PILE=1
 S REPATN=$$NOMINT^%QSF("RESEAU"),REP=$$NOMINT^%QSF("ETAT.RESEAU"),LIEN="ETAT.PRECEDE"
 S UCONT=$$TEMP^%SGUTIL
 D MAKEUC^%QMEXOU
 
NEXNIV 
 S IDFC=$$TEMP^%SGUTIL
 S @IDFC@("CUT")=0,@IDFC@("ATN")=ATN
 G:$$AIR^%QSGE5(REPATN,ATN,"ETAT.RESEAU") RUN
 D ^%VZEAVT($$^%QZCHW("Ce reseau ne comprend aucun etat"))
 D ^%VZEAVT($$^%QZCHW("Vous devez en creer un"))
 Q:'($$AJ^%QMEXNOG)
RUN S NUMET=$$TEMP^%SGUTIL
 
INI D MKVAR
 K @(GRAC)
 S @GRAC="LIS^fictive^0"
 I $$AIR^%QSGE5("RESEAU",ATN,"NOEUD.INITIAL") S IET=ATN_","_$$^%QSCALVA("RESEAU",ATN,"NOEUD.INITIAL"),@GRAC@(IET)="" G TIT
 S IET="" F %IET=0:0 S IET=$$NXTRIAO^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",IET) Q:IET=""  S @GRAC@(ATN_","_$$VALEUR^%QSTRUC8("RESEAU",ATN,"ETAT.RESEAU",IET))=""
TIT D:'($$AIR^%QSGE5("RESEAU",ATN,"CARD")) PA^%QSGESTI("RESEAU",ATN,"CARD",1,1)
 S TITRE="1"_$C(0)_"2"_$C(0)_$$^%QZCHW("Reseau hevea ")_$C(0)_1_$C(0)_20_$C(0)_ATN_$C(0)
 S TITRE=TITRE_"2"_$C(0)_"2"_$C(0)_"Version "_$$^%QSCALIN("RESEAU",ATN,"CARD",1)
 S TITRE=TITRE_"             (le "_$$^%QSCALIN("RESEAU",ATN,"DATE.DERNIERE.MODIFICATION",1)_" a "_$$^%QSCALIN("RESEAU",ATN,"HEURE.DERNIERE.MODIFICATION",1)_")"_$C(0)
 D CLEPAG^%VVIDEO,^%VZEATT
 
 D MAKEGRA^%QMEXO2
 D OFF^%VZEATT
 S I=$$^%QSCALIN(REPATN,ATN,"CONTEXTE.D.ACTIVATION","LARGEUR.VISU")
 S RESSTR=$$INIT^%QULELV(GRAP,GRAC,$S(I="":3,1:I),3,UCONT,TITRE,IDFC)
 S @RESUL@("P")="",@RESUL@("O")=$O(@GRAC@(""))
RERUN 
 D RUN^%QULELV1(RESSTR,@RESUL@("O"),@RESUL@("P"),1,0,RESUL)
 I @RESUL@("NUMUC")=NUMZOOM G GZOOM
 I @RESUL@("NUMUC")=NUMUNZOO G RZOOM
FIN D END^%QULELV(RESSTR)
 D EPILO
 D CLEPAG^%VVIDEO
 K @(PILE),@(IDFC)
 Q
 
 
GZOOM S OBJ=@RESUL@("O")
 S ATNASSO=$$^%QSCALIN("ETAT.RESEAU",OBJ,"RESEAU.ASSOCIE",1)
 I ATNASSO'="" G GZOOM2
t I $$CONFIRM^%PKUTIL(10,10,39,"Il n'y a pas de reseau lie a cet etat, voulez-vous en associer un ?")'=1 G RERUN
 S ATNASSO=$$ACQUER^%QMEXGES($P(OBJ,",",2)) G:ATNASSO="" RERUN
 D PA^%QSGESTI("ETAT.RESEAU",OBJ,"RESEAU.ASSOCIE",ATNASSO)
GZOOM2 S @PILE@(@PILE,"ATN")=ATN,@PILE@(@PILE,"NUMET")=NUMET,@PILE@(@PILE,"RESSTR")=RESSTR,@PILE@(@PILE,"IDFC")=IDFC
 S @PILE=@PILE+1
 S ATN=ATNASSO
 G NEXNIV
 
 
RZOOM D END^%QULELV(RESSTR)
 D EPILO
 K @(IDFC)
 K @PILE@(@PILE)
 S @PILE=@PILE-1 G:@PILE=0 FIN
 S ATN=@PILE@(@PILE,"ATN"),NUMET=@PILE@(@PILE,"NUMET"),RESSTR=@PILE@(@PILE,"RESSTR"),IDFC=@PILE@(@PILE,"IDFC")
 D MKVAR
 G RERUN
 
MKVAR S CARETU=$$CONCAS^%QZCHAD(NUMET,"C")
 S GRAP=$$CONCAS^%QZCHAD(CARETU,"G")
 S RESUL=$$CONCAS^%QZCHAD(CARETU,"RES"),GRAC=$$CONCAS^%QZCHAD(CARETU,"R")
 Q
 
EPILO D PA^%QSGESTI("RESEAU",ATN,"DATE.DERNIERE.MODIFICATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("RESEAU",ATN,"HEURE.DERNIERE.MODIFICATION",$$HEURE^%QMDATE,1)
 D PA^%QSGESTI("RESEAU",ATN,"CARD",$$^%QSCALIN("RESEAU",ATN,"CARD",1)+1,1)
 Q
 
CTRR(TP) 
 S MODG=1 Q
 
ZOOM(TP) 
 S FINEXE=1
 Q
 
UNZOOM(TP) 
 S FINEXE=1
 Q
 ;

