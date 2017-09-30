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

;%QMEXTRF^INT^1^59547,73878^0
%QMEXTRF ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N NFIC,CTR
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATION D'ANCIENS RESEAUX"))
 
 S NFIC="HV"_QUI_".ARD",CTR="" D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,75,9,8,"","",.CTR,.NFIC)
 Q:(CTR="F")!(CTR="A")
 D ON^%VZEATT
 D RESTDON(NFIC)
 D OFF^%VZEATT
 Q
 
RESTDON(FICHIER) 
 N RENOMAGE,NOM,MSG,REP,ATT,ORDL,MODEREST
 N INDS,INDD,LIEN,REPS,REPD,CTR,ORD
 N COMM1,COMM2,COMM3,COMM4,COMM5,COMM6,COMM7,%I
 N RENOMIND,BIDON,SEP,NUMIO,OKOPEN,LIGNE,RES,REPLIEN,STATUSFICH,IND
 N REPTRF,LIENTRF
 
 S BIDON=$$TEMP^%SGUTIL
 S RENOMIND=$$TEMP^%SGUTIL
 
 S REPLIEN=$$LIENI^%QSGEL3
 
 S SEP="^"
 S MODEREST=0
 
 
 D OPENFILE^%SYSUTI1(FICHIER,"R",.NUMIO,.OKOPEN)
 G:'(OKOPEN) FIN
 
 
 F %I=1:1 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) Q:LIGNE=""
 
 
 S LIGNE=""
LECTBIND 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:LIGNE="" LECTBILN
 
 S OREP=$P(LIGNE,SEP,1),REP=$$TRFREP(OREP)
 S IND=$P(LIGNE,SEP,2)
 S RES=$$CREER^%QSGEIND(REP,IND,$P(LIGNE,SEP,3),1,.MSG)
 
LECTATTI 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:LIGNE="" LECTBIND
 
 S ATT=$P(LIGNE,SEP,1),ORD=$P(LIGNE,SEP,2)
 I $$TYPEASP^%QMCPZ(WHOIS,QUI,REP,ATT)="TEXTE" D LECTNOTE(REP,IND,ORD)
 D PA^%QSGESTI(REP,IND,ATT,$P(LIGNE,SEP,3),ORD)
 G LECTATTI
 
 
 
 
 
 
LECTBILN 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:(LIGNE'="")&('($F(LIGNE,"^"))) LECTMLX2
LECTILN 
 G:'(STATUSFICH) FIN
 G:LIGNE="" LECTMLX
 
 S REPS=$$TRFREP($P(LIGNE,SEP,1))
 S INDS=$P(LIGNE,SEP,2)
 S LIEN=$$TRFLIEN($P(LIGNE,SEP,3))
 S INDD=$P(LIGNE,SEP,4)
 S REPD=$$TRFREP($P(LIGNE,SEP,5))
 S ORDL=$P(LIGNE,SEP,6)
TESTYPAT 
 I ($$TYPE2^%QSGEST9(REPS,LIEN)=2)!($$TYPE2^%QSGEST9(REPS,LIEN)=1) G NOMINDLN
 
 I $$OVAIR^%QSGE5(REPS,INDS,LIEN,INDD,ORDL)'=1 D ADDS^%QSGES26(REPS,INDS,LIEN,REPD,INDD)
NOMINDLN 
 S IND=$$NOML1^%QSGES20(INDS,ORDL,LIEN,INDD)
 
LECTATTL 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 I LIGNE="" S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) G LECTILN
 
 D PA^%QSGESTI(REPLIEN,IND,$P(LIGNE,SEP,1),$P(LIGNE,SEP,3),$P(LIGNE,SEP,2))
 G LECTATTL
 
 
 
LECTMLX 
 S LIGNE=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 G:'(STATUSFICH) FIN
 G:LIGNE="" FIN
LECTMLX2 
 
 F %I=1:1:7 S @("COMM"_%I)=$$READ^%SYSUTI1(NUMIO,.STATUSFICH)
 I '($$EXIST^%LXSTOCK(LIGNE)) D STOCK^%LXAJMOD(LIGNE,COMM1,COMM2,COMM3,COMM4,COMM5,COMM6,COMM7,BIDON)
 G LECTMLX
 
 
 
FIN D CLOSE^%SYSUTI1(NUMIO,"R")
 K @(BIDON),@(RENOMIND)
 Q
 
 
LECTNOTE(R,I,O) 
 N LGN,NLGN
 S LGN=""
 F NLGN=1:1 S LGN=$$READ^%SYSUTI1(NUMIO,.STATUSFICH) Q:LGN=""  S ^[QUI]QUERYT(R,I,O,"LIGNE",NLGN)=LGN
 Q
 
TRFREP(NOMINT) 
 Q:NOMINT="ATN" "RESEAU"
 Q:NOMINT="ETAT" "ETAT.RESEAU"
 Q NOMINT
 
TRFLIEN(NOMLIEN) 
 Q:NOMLIEN="ATN" "RESEAU"
 Q:NOMLIEN="ETAT" "ETAT.RESEAU"
 Q:NOMLIEN="SUIT" "ETAT.SUIT"
 Q:NOMLIEN="SUIVI.DE" "ETAT.PRECEDE"
 Q NOMLIEN
 
 
 
 
 
 
 
 
OUT(FILE) 
 N LISTE,LISTATT,BASE,GLILA,LPF,LINVO,REPLIEN
 S BASE="ATN",LPF="ETAT",REPNODE="ETAT",LINVO="SUIVI.DE"
 S REPLIEN=$$LIENI^%QSGEL3
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="ATN",LPF="ETAT",REPNODE="ETAT"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","ATN")
 S ATN="" F %A=0:0 S ATN=$$NXTRI^%QSTRUC8(BASE,ATN) Q:ATN=""  D AJOUT^%QS0XG1(LISTE,ATN)
 S LISTATT=$$GEN^%QCAPOP("LTN")
 S GLILA(1)=LPF,GLILA(2)=LINVO
 D ADD^%QMLILA(LISTATT,"GLILA")
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,4,FILE,"reseaux de "_QUI)
 D ELIML^%QS0XG1(LISTE)
 D DEL^%QMLILA(LISTATT)
 Q
 ;
 ;

