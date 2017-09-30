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

;%TLOB18^INT^1^59547,74030^0
%TLOB18 ;;10:04 AM  25 Mar 1993; ; 28 Oct 93  4:39 PM
 
 
 
 
 
 
 
 
 
 
EVAL(IDEB,NBREG) 
 N %VNG,%VNGA,TEMPENT,TEMPSOR,%VNE,%VNI,ATNASSO
 S ATNASSO=V(IDEB+1)
 S TEMPENT=$$TEMP^%SGUTIL
 S TEMPSOR=$$TEMP^%SGUTIL
 D COPY^%QCAGLC("^PARAENT("_$J_")",TEMPENT)
 D COPY^%QCAGLC("^PARASOR("_$J_")",TEMPSOR)
 K ^PARAENT($J),^PARASOR($J)
 S %VNG(5)=ATNASSO
 
 S %VNGA=1
 S %VNE(%VNGA,1)=%VNG(5)
 S %VNE(%VNGA,2)=$$GEN^%QCAPOP("ATN")
 S %VNE(%VNGA,3)=$$VISIBLE^%ATNEXE3(ATNASSO)
 
 S %VNE(%VNGA,7)=-1
 S %FIN=0
 S ^PARAENT($J,%VNGA,"REPFOC")=V(IDEB+2)
 S ^PARAENT($J,%VNGA,"INDFOC")=V(IDEB+3)
 D COPY2^%QCAGLC("CXT","^PARAENT("_$J_",1,""CXT"")")
 D START^%ATNEXE
 
 
 
 D COPY2^%QCAGLC("^PARASOR("_$J_",1,""CXT"")","CXT")
 D COPY^%QCAGLC(TEMPENT,"^PARAENT("_$J_")")
 D COPY^%QCAGLC(TEMPSOR,"^PARASOR("_$J_")")
 K @(TEMPENT),@(TEMPSOR)
 D CLEPAG^%VVIDEO
 Q %VNE(%VNGA,2)
 
 
 
 
EXAMREP(IDEB,NBREG) 
 D ^%QSMOVIS
 Q 1
 
 
 
CLEPAG(IDEB,NBREG) 
 D CLEPAG^%VVIDEO
 Q 1
 
 
 
 
FIXERATT(IDEB,NBREG) 
 N DI,DUR,TY,VDEF
 S DI=$S(NBREG<1:$I,V(IDEB)="":$I,1:V(IDEB))
 G:NBREG<2 FIXSTD G:V(IDEB+1)="" FIXSTD
 S DUR=$S(V(IDEB+1)>0:V(IDEB+1),1:0)
 S ^TOZE(DI,"ATTENTE")=DUR
 Q 1
FIXSTD 
 Q:'($$VDEF^%VTOZE("ATTENTE",.TY,.VDEF))
 S ^TOZE(DI,"ATTENTE")=VDEF
 Q 1
 
 
 
 
 
 
 
 
 
 
CONSULT(IDEB,NBREG) 
 N LLI
 S LLI=$S(NBREG=2:"*",V(IDEB+2)=$C(0):"*",1:V(IDEB+2))
 Q $$^%QMCAIND(V(IDEB),LLI,V(IDEB+1))

