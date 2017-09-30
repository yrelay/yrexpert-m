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

;%QMEXUTI^INT^1^59547,73878^0
%QMEXUTI ;;09:40 AM  8 Sep 1993; 14 Oct 92  5:03 PM ; 14 Mar 93 12:12 PM
 
 
 
NOMRESO(ETAT) Q $P(ETAT,",")
 
REPRESO() Q $$NOMINT^%QSF("RESEAU")
 
REPETAT() Q $$NOMINT^%QSF("ETAT.RESEAU")
 
 
 
UCETAT(ATN,ETAT,ETATP) 
 N ETU,ID,NUM
 Q:'($E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1))
 S ETU=$$GET^%SGVAR("JRN")
 
 
 
 I ($D(^[QUI]RQSDON("AFFITRANS",ETU))#10)=0 S ^[QUI]RQSDON("AFFITRANS",ETU)=0
 S (ID,^[QUI]RQSDON("AFFITRANS",ETU))=^[QUI]RQSDON("AFFITRANS",ETU)+1
 S NUM=1 G:ETATP="" UCET2
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM)="etat precedent : "_$$VALEX^%ATNEXE3(ETATP)
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM,"TYPE")="ETAT"
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM)=ATN_$C(0)_$$VALEX^%ATNEXE3(ETATP)
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM,"VAL")=$$VALEX^%ATNEXE3(ETATP)
 S NUM=NUM+1
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM)="transition entre "_$$VALEX^%ATNEXE3(ETATP)_" et "_$$VALEX^%ATNEXE3(ETAT)
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM,"TYPE")="TRANSITION"
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM)=ATN_$C(0)_$$VALEX^%ATNEXE3(ETATP)_$C(0)_$$VALEX^%ATNEXE3(ETAT)
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM,"VAL")=1
 S NUM=NUM+1
UCET2 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM)="etat resultat : "_$$VALEX^%ATNEXE3(ETAT)
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM,"TYPE")="ETAT"
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM)=ATN_$C(0)_$$VALEX^%ATNEXE3(ETAT)
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM,"VAL")=$$VALEX^%ATNEXE3(ETAT)
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID)=NUM
 S TXR=ATN_$C(0)_$$VALEX^%ATNEXE3(ETAT)_$C(0)_^PARAENT($J,%VNGA,"REPFOC")_$C(0)_^PARAENT($J,%VNGA,"INDFOC")_$C(0)_"ETAT"_$C(0)_ID
 
 D NOUVINST^%AMJAJ(ETU,"changement d'etat",TXR)
 D ADDEXEC^%AMJAJ(ETU,"ETAT","",ATN,$$VALEX^%ATNEXE3(ETAT),"","","","")
 
 Q
 
 
 
 
 
 
 
UCTRANS(ATN,ETAT1,ETAT2,VAL) 
 N ID,NUM,ETU
 
 I VAL="?" Q "?"
 Q:'($E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1)) VAL
 S ETU=$$GET^%SGVAR("JRN") Q:ETU="" VAL
 S ID=%VNE(%VNGA,2)_@%VNI(%VNGA,2)
 I '($D(^[QUI]RQSDON("AFFITRANS",ETU,ID))) S ^[QUI]RQSDON("AFFITRANS",ETU,ID)=0
 S (NUM,^[QUI]RQSDON("AFFITRANS",ETU,ID))=^[QUI]RQSDON("AFFITRANS",ETU,ID)+1
 S ^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM)="transitition entre "_$$VALEX^%ATNEXE3(ETAT1)_" et "_$$VALEX^%ATNEXE3(ETAT2),^[QUI]RQSDON("AFFITRANS",ETU,ID,NUM,"TYPE")="TRANSITION"
 S ^[QUI]RQSDON("VALTRANS",ETU,ID,NUM)=ATN_$C(0)_$$VALEX^%ATNEXE3(ETAT1)_$C(0)_$$VALEX^%ATNEXE3(ETAT2),^[QUI]RQSDON("VALTRANS",ETU,ID,NUM,"VAL")=VAL
 D NOUVINST^%AMJAJ($$GET^%SGVAR("JRN"),"trouver une transition",ATN_$C(0)_$$VALEX^%ATNEXE3(ETAT1)_$C(0)_^PARAENT($J,%VNGA,"REPFOC")_$C(0)_^PARAENT($J,%VNGA,"INDFOC")_$C(0)_"TRANSIT"_$C(0)_ID)
 D ADDEXEC^%AMJAJ($$GET^%SGVAR("JRN"),"TRANSITION",VAL,ATN,$$VALEX^%ATNEXE3(ETAT1),$$VALEX^%ATNEXE3(ETAT2),"","","")
 
 Q VAL
 
INITRQS 
 S ^%RQSGLO("MOTEUR","HEVEA","UCONT.ETAT")="UCETAT^%QMEXUTI"
 S ^%RQSGLO("MOTEUR","HEVEA","UCONT.TRANSITION")="$$UCTRANS^%QMEXUTI"
 S ^%RQSGLO("MOTEUR","HEVEA","SAISIE.ENTREES")="$$LEC^%QMEXUT2"
 Q
 ;

