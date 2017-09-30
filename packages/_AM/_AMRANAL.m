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

;%AMRANAL^INT^1^59547,73865^0
%AMRANAL ;;04:22 PM  5 Aug 1993;
 
 
 
 
 
 
 
 
ANALTRT(TRT) 
 K ^[QUI]RQSDON("ANTRT",TRT)
 S REG=""
NXRG S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""
 S GLOSTO=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S GLOSTO=$$CONCAS^%QZCHAD(GLOSTO,REG)
 S RESAN=$$ANAREGLE(^[QUI]TTL(TRT,2,REG),$$CONCAS^%QZCHAD(GLOSTO,"POLC"),$$CONCAS^%QZCHAD(GLOSTO,"POLA"),$$CONCAS^%QZCHAD(GLOSTO,"EXPC"),$$CONCAS^%QZCHAD(GLOSTO,"EXPA"))
 G NXRG
 
 
 
 
 
 
 
 
 
ANAREGLE(CHAINE,POLO1,POLO2,SSEXP1,SSEXP2,MESSERR) 
 N SSEVAL,RES
 S SSEVAL=$$TEMP^%SGUTIL
 S MESSERR=""
 S %VNGA=1
 S %VNE(%VNGA,1)="ANALEX2"
 K ^PARAENT($J,%VNGA),^PARASOR($J,%VNGA)
 S ^PARAENT($J,%VNGA,"CHAINE")=CHAINE
 S %PILRET=$$INITLIFO^%SGUTIL
 D PUSHLIFO^%SGUTIL(%PILRET,"RETEXTER^%AMRANAL")
 G START^%AMRALX0
RETEXTER D KILLLIFO^%SGUTIL(%PILRET)
 I '(^PARASOR($J,%VNGA,"OKLEX")) S MESSERR="probleme a l'analyse syntaxique" Q 0
 S GLO="^PARASOR("_$J_","_%VNGA_",""SKEL"")"
 S TRAD="^PARASOR("_$J_","_%VNGA_",""TRAD"")"
 S NB=^PARASOR($J,%VNGA,"SKEL")
 S @POLO1=0,@POLO2=0,@SSEXP1=0,@SSEXP2=0
 S RES=1
 D ANASYNT^%AMRANAR
 I @POLO1'=0 S r=$$PARCOURS^%AMREVAL(POLO1,1,0,SSEXP1,SSEVAL)
 S r=$$PARCOURS^%AMREVAL(POLO2,1,0,SSEXP2,SSEVAL)
 Q RES
 
 
 
 
 
VISUAN(TRT) 
 S REG=""
NXRGV S REG=$O(^[QUI]TTL(TRT,2,REG)) Q:REG=""
 S GLOSTO=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""ANTRT"")",TRT)
 S GLOSTO=$$CONCAS^%QZCHAD(GLOSTO,REG)
 I $D(@GLOSTO@("EXPC")) S r=$$AFFIFEN^%AMUTXT("condition",$$CONCAS^%QZCHAD(GLOSTO,"EXPC"),"",.NINST,.NEV)
 S r=$$AFFIFEN^%AMUTXT("action",$$CONCAS^%QZCHAD(GLOSTO,"EXPA"),"")
 G NXRGV
 ;

