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

;%SCOA3^INT^1^59547,73887^0
SCOA3 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT 
 N LISDOM,LISICIB,LISRSOU,LISRCIB,ARPREM,ACCOR,REPS,OBJS,VISU,%ROUT99,ETU
 S REPS=@SCX@("BASE.REFERENCE")
 S OBJS=@SCX@("OBJET.REFERENCE")
 S LISRSOU=@SCX@("REPERTOIRE.REFERENCE")
 S LISRCIB=@SCX@("REPERTOIRE.CIBLE")
 S LISICIB=@SCX@("OBJET.CIBLE")
 S LISDOM=@SCX@("DOMAINE")
 S ACCOR=@SCX@("TAUX.ACCORD")
 S ARPREM=@SCX@("ARRET/PREMIER")
 S VISU=@SCX@("VISU")
 S ETU=@SCX@("ETUDE")
 S %ROUT99=@SCX@("ROUTINE.EVALUATION")
 N AT,OR,V1,V2,DOM,ECHEC,LISTE,REPSI,NBREG,SUCCES,SAVDOM
 N TEMPO S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 N LMALUS S LMALUS=$$CONCAS^%QZCHAD(TEMPO,"MALUS")
 N LATTS S LATTS=$$CONCAS^%QZCHAD(TEMPO,"ATT.SOURCE")
 N LATTC S LATTC=$$CONCAS^%QZCHAD(TEMPO,"ATT.CIBLE")
 N RESULTAT S RESULTAT=$$CONCAS^%QZCHAD(TEMPO,"RESULTAT")
 N LISTRES S LISTRES=$$CONCAS^%QZCHAD(TEMPO,"LISTE.RESULTAT")
 N CONTEXT S CONTEXT=$$CONCAS^%QZCHAD(TEMPO,"CONTEXTE"),@CONTEXT=0
 N EV S EV=$$CONCAS^%QZCHAD(TEMPO,"EVALUATION.POUR")
 N SAVDOM S SAVDOM=$$CONCAS^%QZCHAD(TEMPO,"SAUVEGARDE.DOMAINE")
 N WARNING S WARNING=$$CONCAS^%QZCHAD(TEMPO,"WARNING")
 G DEB^%SCOA1
 
 
JOURNAL 
 Q:ETU=""
 Q:NIV'=0
 N TOTAL,TOTREG,UDL,COMPTE,TO
 I '($D(^[QUI]RQSGLO("SCX",ETU))) S COMPTE=1 D ENTETE G JOUR1
 S COMPTE=^[QUI]RQSGLO("SCX",ETU)
JOUR1 N NIVO,DOMEN S NIVO=""
 F I=0:0 S NIVO=$O(@EV@(NIVO)) Q:NIVO=""  S DOMEN="" F I=1:1 S DOMEN=$O(@EV@(NIVO,DOMEN)) Q:DOMEN=""  D JOUR2
 S ^[QUI]RQSGLO("SCX",ETU)=COMPTE
 Q
JOUR2 
 S TOTREG=@EV@(NIVO,DOMEN,"REGLE")
 S UDL="-----------" F I=1:1:$L(OBJCIB) S UDL=UDL_"-"
 I NIVO=0 D INDIV
 D NIVO
 S A="",TOTAL=0
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J("",10)_"nombre total de regles"_"    : "_@LMALUS@(DOMEN)_$J("",6)_"nombre de regles evaluees"_" : "_@EV@(NIVO,DOMEN,"REGLE")
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J("",10)_"nombre de regles reussies"_" : "_@EV@(NIVO,DOMEN,"SUCCES")
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J("",10)_"nombre d'attributs dont aucune regle n'a ete reussie "_"    : "_@EV@(NIVO,DOMEN,"NON.EVALUES")
 
JOUR3 
 I NIVO=0 D INCR S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J("",10)_"taux realise"_" : "_$J(@EV@(NIVO,DOMEN,"TAUX.ATTEINT"),1,4)
 S A="" F I=0:0 S A=$O(@EV@(NIVO,DOMEN,"ATTRIBUT",A)) Q:A=""  I @EV@(NIVO,DOMEN,"ATTRIBUT",A)=0 D INCR S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J("",10)_"echec pour"_" : "_A
 D INCR,SAUT
 Q
INCR S COMPTE=COMPTE+1 Q
 
ENTETE 
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$TR($J(" ",75)," ","-")
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$J(" ",3)_"compte rendu de l'etude"_" : "_ETU_$J(" ",11)_"date"_" : "_$$TEMPS^%QMDATE
 D INCR
 D SAUT
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)="repertoire de reference"_" : "_REPS
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)="individu de reference"_" : "_OBJS
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)="taux d'accord vise"_" : "_ACCOR_$J(" ",15)_"arret/1er"_" : "_ARPREM
 D INCR
 D SAUT
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$TR($J(" ",75)," ","-")
 D INCR
 Q
NIVO 
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)="  "_"niveau"_" : "_NIVO_"       "_"domaine"_" : "_DOMEN
 Q
STOP() 
 N M D POCLEPA^%VVIDEO
 S M=$$MES^%VZEOUI($$^%QZCHW("arret immediat")_" : ","N")
 I M'=0 D ARRET Q 1
 D POCLEPA^%VVIDEO W $$^%QZCHW("poursuite de l'etude")
 Q 0
ARRET 
 N COMPTE
 S COMPTE=^[QUI]RQSGLO("SCX",ETU)
 D SAUT
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=$$^%QZCHW("arret demande par l'utilisateur")
 S ^[QUI]RQSGLO("SCX",ETU)=COMPTE
 D ^%VZEATT
 Q
 
SAUT 
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=" "
 D INCR
 Q
INDIV 
 N TO
 I @EV@(NIVO,DOMEN,"REGLE")=0 S TO=0 G INDIV0
 I @EV@(NIVO,DOMEN,"SUCCES")=0 S TO=0 G INDIV0
 S TO=@EV@(NIVO,DOMEN,"SUCCES")/(@EV@(NIVO,DOMEN,"REGLE")+@EV@(NIVO,DOMEN,"NON.EVALUES")),TO=$J(TO,1,4)
INDIV0 D SAUT,SAUT
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)="individu"_" : "_OBJCIB_$J(" ",10)_$S(TO'<ACCOR:"*** "_"comparable a"_" "_OBJS_" ***",1:"")
 D INCR
 S ^[QUI]RQSGLO("SCX",ETU,COMPTE)=UDL
 D INCR
 S @EV@(NIVO,DOMEN,"TAUX.ATTEINT")=TO
 Q
 
FIN 
 I '($D(@WARNING)) Q
 N COMPTE
 I '($D(^[QUI]RQSGLO("SCX",ETU))) S COMPTE=1 D ENTETE,SAUT
 S COMPTE=""
 S ^[QUI]RQSGLO("SCX",ETU,9)="---------------------------- erreurs generales ----------------------------"
 F I=0:0 S COMPTE=$ZP(^[QUI]RQSGLO("SCX",ETU,COMPTE)) Q:COMPTE'>10  S ^[QUI]RQSGLO("SCX",ETU,COMPTE+@WARNING)=^[QUI]RQSGLO("SCX",ETU,COMPTE)
 S COMPTE=""
 F I=1:1:@WARNING S COMPTE=$O(@WARNING@(COMPTE)) Q:COMPTE=""  S ^[QUI]RQSGLO("SCX",ETU,9+I)=COMPTE
 S ^[QUI]RQSGLO("SCX",ETU,10+I)=""
 Q

