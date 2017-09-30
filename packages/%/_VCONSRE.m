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

;%VCONSRE^INT^1^59547,74034^0
%VCONSRE(GR) ;;02:54 PM  4 Sep 1996
 
 N PREF,SUF,NBCHP,BID
 S PREF=^%SCRE(GR,"GLOSTOC")
 S SUF=""
BOUCLE1 
 S SUF=$O(@PREF@(SUF))
 G:SUF="" SUITE
 S SUF=$S((SUF+0)=SUF:SUF,1:""""_SUF_"""")
 S PREF=$S(PREF["(":$E(PREF,1,$L(PREF)-1)_","_SUF_")",1:PREF_"("_SUF_")")
 S SUF=""
 G BOUCLE1
SUITE 
 W !,PREF
 D ^%QCAGLCN(PREF,"BID")
 S AUX=$P(PREF,"(",2)
 S AUX=$P(AUX,")",1)
 S NBCLE=$$NCLE^%VCARGR(GR,^%SCRE(GR))
 G:BID'=NBCLE PASS
 S NBNCLE=$$NONCLE^%VCARGR(GR,^%SCRE(GR))
 D TCLE^%VCARGR(GR)
 D TNONCLE^%VCARGR(GR)
 S SCR=GR
 S ^J($J)=1
 F I=1:1:NBCLE D TESTCLE(I)
 F I=1:1:NBCLE S RESUL(TABCLE(I))=CL(I)
 F I=1:1:NBNCLE S RESUL(TABNCLE(I))=$P(@PREF,"^",I)
 K ^J($J)
 D ^%QSSTOC
PASS S PREF="^[QUI]"_$E($$^%Q($Q(@PREF)),2,$L($$^%Q($Q(@PREF))))
 G:PREF="^[QUI]" FIN
 G SUITE
 Q
 
TESTCLE(IND) 
 
 N JBIS
 S JBIS=^J($J)
TESTBOU 
 S CL(I)=$P(AUX,",",JBIS,^J($J))
 S ^J($J)=^J($J)+1
 Q:(CL(I)+0)=CL(I)
 S L=$L(CL(I))
 S TE=($E(CL(I),1)="""")&($E(CL(I),L)="""") I TE X "S CL(I)="_CL(I)
 Q:TE
 G TESTBOU
 
FIN Q

