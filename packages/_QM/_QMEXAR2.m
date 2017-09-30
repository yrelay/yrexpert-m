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

;%QMEXAR2^INT^1^59547,73878^0
%QMEXAR2 ;;10:56 AM  12 Mar 1993; 07 Dec 92  2:52 PM ; 18 Mar 93  8:54 AM
 
 
 
 
SAISIE(FILE1,FILE2,FILE3,MODE) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S (FILE1,VALDEF(1))=WHOIS_".ARD",(FILE2,VALDEF(2))=WHOIS_".ARC",(FILE3,VALDEF(3))=WHOIS_".AR2"
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) 0
 S FILE1=$P(STOCK,$C(0),1),FILE2=$P(STOCK,$C(0),2),FILE3=$P(STOCK,$C(0),3)
 K STOCK,@(GLO)
 Q 1
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=3
 S @GLO@("FL")="LDR"
 S @GLO=$S(MODE=1:"fichiers qui contiendront les differentes informations",1:"fichiers contenant differentes informations")
 S @GLO@("H")=6,@GLO@("V")=4
 S @GLO@("NBC")=NBC
 S PLL=0,J=0 F I="Individus RESEAUx","Savoir-faire associe","Saisies interactives" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=35 F I=1:1:NBC S @GLO@("LARG",I)=35
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 S @GLO@("POP1")="",@GLO@("POP2")=""
 G:'(MODE) AIDE0
 S @GLO@("AIDE",1)=" Nom du fichier qui contiendra les individus du repertoire RESEAU"_$C(0)_"ainsi que les ETAT.RESEAU concernes."_$C(0)_"Ce fichier est a restaurer par l'option de restauration"_$C(0)_"d'individus."
 S @GLO@("AIDE",2)=" Nom du fichier qui contiendra le savoir-faire associe"_$C(0)_"aux RESEAUx (traitements, listes, predicats, ..)"_$C(0)_"Ce fichier est a restaurer par l'option de"_$C(0)_"restauration de connaissance."
 S @GLO@("AIDE",3)=" Nom du fichier qui contiendra les saisies interactives"_$C(0)_"associees aux RESEAUx, ce fichier est a restaurer par l'option"_$C(0)_"de restauration d'individus."_$C(0)
 S @GLO@("AIDE",3)=@GLO@("AIDE",3)_"Il peut ne pas exister s'il n'y a pas de saisies"_$C(0)_"dans les reseaux a archiver"
 G AIDEFIN
 
AIDE0 
 S @GLO@("AIDE",1)=" Nom du fichier qui contient les individus du repertoire RESEAU"_$C(0)_"ainsi que les ETAT.RESEAU concernes."
 S @GLO@("AIDE",2)=" Nom du fichier qui contient le savoir-faire associe"_$C(0)_"aux RESEAUx (traitements, listes, predicats, ..)"
 S @GLO@("AIDE",3)=" Nom du fichier qui contient les saisies interactives"_$C(0)_"associees aux RESEAUx."_$C(0)
 S @GLO@("AIDE",3)=@GLO@("AIDE",3)_"Il peut ne pas exister s'il n'y a pas de saisies"_$C(0)_"dans les reseaux archives"
 
AIDEFIN 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)=TJSOK
 S @GLO@("UCONT.CHAMPS",2)=TJSOK
 S @GLO@("UCONT.CHAMPS",3)=TJSOK
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 ;
 ;
 ;

