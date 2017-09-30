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
;! Nomprog     : %TLDIAL2                                                     !
;! Module      : TRAITEMENTS sur LISTES                                       !
;! But         : Manipulation des traitements                                 !
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

;%TLDIAL2^INT^1^59547,74028^0
%TLDIAL2 ;
 
 
 
 
 
 
 
 
 
 
 
CREAT() 
C1 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Traitement : "),Y1=$$GETLBLAN^%VTLBLAN(Y1)
 I CTRLA!(Y1="") Q 1
 I $$EXISTE^%TLGEST(Y1) D M("Deja existant ... creation refusee") G C1
 I $L(Y1,",")'=1 D M("Le nom ne doit pas contenir de virgule") G C1
 S LISTOK=0
 D CREER^%TLGEST(Y1)
 D ^%TLSAISI(Y1) Q 2
 
 
 
 
DUPLI() N R,TRT,NEWTR,I,BASE,TABC,TYPE,SELEC,P,J,NY1
 S R=1
 S TABC(1)="d'un traitement",TABC(2)="d'un ensemble de traitements"
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 S TYPE=$$MES^%VZECHO($$^%QZCHW("duplication")_" : ","TABC")
 G:TYPE="d'un ensemble de traitements" DUPLN
DUPL1 S TRT=$$GET("Traitement a dupliquer : ",.R) Q:TRT="" R
DUP2 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Nom de la recopie : ")
 S Y1=$$GETLBLAN^%VTLBLAN(Y1) I CTRLA!(Y1="") Q 2
 I $$EXISTE^%TLGEST(Y1) D M("Deja existant ... duplication refusee") G DUP2
 I $L(Y1,",")'=1 D M("Le nom ne doit pas contenir de virgule") G DUP2
 S LISTOK=0
 S NEWTR=Y1
 S BASE=$$ONE^%QSGEL3("TRAITEMENT")
 D RECTRT^%TLGEST(WHOIS,QUI,TRT,WHOIS,QUI,NEWTR,1,1)
 D ^%TLSAISI(NEWTR)
 Q 2
 
DUPLN 
 D LIRE2^%VREAD($$^%QZCHW("Traitements")_"  : ","",0,78,21,21,"","",.CTR,.Y1)
 S SELEC=$$TEMP^%SGUTIL
 D SEARCHW^%LXABR2(Y1,"^[QUI]TTL",SELEC)
 I @SELEC=0 D ^%VZEAVT($$^%QZCHW("Aucun traitement trouve")) G DUPLN
 D LIRE2^%VREAD($$^%QZCHW("Nouveaux noms")_"  : ","",0,78,21,21,"","",.CTR,.NY1)
 S NY1=$TR($TR(NY1,"#","*"),"?","*")
 S TRT="" F I=0:0 S TRT=$O(@SELEC@(TRT)) Q:TRT=""  S NEWTR=$$NEWTR W !,TRT,!,"-->",!,NEWTR D RECTRT^%TLGEST(WHOIS,QUI,TRT,WHOIS,QUI,NEWTR,1,1)
 Q 2
NEWTR() 
 N L
 S L=$L(NY1,"*")-1
 S NEWTR=NY1
 F J=1:1:L S NEWTR=$P(NEWTR,"*")_$P(@SELEC@(TRT),"/",J)_$P(NEWTR,"*",2,999)
 Q NEWTR
 
 
 
 
MODIF() N R,Y1
 S R=1
 S Y1=$$GET("Traitement : ",.R) Q:Y1="" R
 S LISTOK=0
 D ^%TLSAISI(Y1) Q 2
 
 
 
 
ANAL() N R,LISTE,LS,LT,CH
ANA S LS=$$^%QZCHW("Selectionner"),LT=$$^%QZCHW("Tous")
 D POCLEPA^%VVIDEO
 S CH=$$^%VZECH2("",LS,LT)
 Q:(CH'=LS)&(CH'=LT) 1
 
 I CH=LT D ALL^%TLALLAN G FANA
 
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRT")
 K @(LISTE)
 D AIDE2^%TLDIAL4(ICI,"P",0,LISTE)
 G:$O(@LISTE@(""))="" FANA
 D PART^%TLALLAN(LISTE)
 K @(LISTE)
 
FANA S LISTOK=0
 Q 2
 
 
 
 
COMPIL() N R,LISTE,LS,LT,CH
CMP S LS=$$^%QZCHW("Selectionner"),LT=$$^%QZCHW("Tous")
 D POCLEPA^%VVIDEO
 S CH=$$^%VZECH2("",LS,LT)
 Q:(CH'=LS)&(CH'=LT) 1
 
 I CH=LT D ALL^%TLOCMP G FCMP
 
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRT")
 K @(LISTE)
 D AIDE2^%TLDIAL4(ICI,"P",0,LISTE)
 G:$O(@LISTE@(""))="" FCMP
 D PART^%TLOCMP(LISTE)
 K @(LISTE)
 
FCMP S LISTOK=0
 Q 2
 
 
 
 
 
 
SUPPR() N BID,I,R
 S R=1
 S Y1=$$GET("Traitement : ",.R) Q:Y1="" R
 Q:$$NOKOBJ^%INCOIN2("TRAITEMENT",R) R
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer ")_Y1_" ? : ")'=1 Q R
 S LISTOK=0
 D POCLEPA^%VVIDEO,SUPP^%TLGEST(Y1),POCLEPA^%VVIDEO
 W $$^%QZCHW("OK") H 5E-1 Q R
 
 
AIDE(ICI,TRT) 
 N ENS,VENS
 S ENS="VENS"
 D AIDE2^%TLDIAL4(ICI,1,1,ENS)
 S TRT=$O(VENS(""))
 Q
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q
 
 
 
 
 
 
 
 
 
GET(MESGET,ZZZ)
ZZG N TRT,CTRLA,CONCUR,Y1,NY1,CTR,VDEF
ZGET2 D POCLEPA^%VVIDEO
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1),1:"")
 I VDEF'="",'($$EXISTE^%TLGEST(VDEF)) S VDEF=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,$Y,$Y-1,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 S ECRMOD=0,CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,"^[QUI]TTL",.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Traitement inconnu")) G ZGET2
 S ZZZ=ZZZ+ECRMOD
 Q:NY1="" ""
 I NY1'=Y1 D POCLEPA^%VVIDEO W MESGET_" "_NY1 H 5E-1 S Y1=NY1
 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1
 Q Y1
 
 
 
 
 
 
 
 
GETSPE(MESGET,ZZZ) 
 N TRT,CTRLA,CONCUR,Y1,NY1,CTR,VDEF
 D POCLEPA^%VVIDEO
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),2)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),2),1:"*")
 D LIRE2^%VREAD(MESGET,VDEF,0,78,$Y,$Y-1,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 I Y1="*" S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1 Q Y1
 S ECRMOD=0,CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,"^[QUI]TTL",.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Traitement inconnu")) G ZGET2
 S ZZZ=ZZZ+ECRMOD
 Q:NY1="" ""
 I NY1'=Y1 D POCLEPA^%VVIDEO W MESGET_" "_NY1 H 5E-1 S Y1=NY1
 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),2)=Y1
 Q Y1
 ;

